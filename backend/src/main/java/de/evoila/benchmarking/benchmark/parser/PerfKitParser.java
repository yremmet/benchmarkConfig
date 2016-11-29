package de.evoila.benchmarking.benchmark.parser;


import com.esotericsoftware.yamlbeans.YamlException;
import com.esotericsoftware.yamlbeans.YamlReader;
import de.evoila.benchmarking.Configuration;
import de.evoila.benchmarking.benchmark.runner.PerfKitRunner;
import de.evoila.benchmarking.data.benchmark.Benchmark;
import de.evoila.benchmarking.data.benchmark.Flag;
import de.evoila.benchmarking.data.benchmark.Setting;
import de.evoila.benchmarking.data.benchmark.VMGroup;
import de.evoila.benchmarking.data.benchmark.repositories.FlagRepository;
import de.evoila.benchmarking.data.benchmark.repositories.BenchmarkRepository;
import de.evoila.benchmarking.data.benchmark.repositories.SettingRepository;
import de.evoila.benchmarking.data.benchmark.repositories.VMGroupRepsitory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/**
 * Created by enat on 27/10/16.
 */

@Component
public class PerfKitParser {


        private static final Logger log = Logger.getLogger(PerfKitParser.class);
        private static final String NAME_STR = "BENCHMARK_NAME";
        private static final String CONFIG_STR = "BENCHMARK_CONFIG";
        private static final String FLAG_INTEGER_STR = "flags.DEFINE_integer";
        private static final String FLAG_ENUM_STR = "flags.DEFINE_enum";
        private static final String FLAG_LIST_STR = "flags.DEFINE_list";
        private static final String FLAG_STRING_STR = "flags.DEFINE_string";
        private static final String FLAG_FLOAT_STR = "flags.DEFINE_float";
        private static final String FLAG_BOOLEAN_STR = "flags.DEFINE_boolean";

        @Autowired
        BenchmarkRepository benchmarkRepository;
        @Autowired
        VMGroupRepsitory vmGroupRepository;
        @Autowired
        FlagRepository flagRepository;
        @Autowired
        SettingRepository settingRepository;

        @Autowired
        Configuration configuration;


        public void parseConfigs(){

            log.debug("Run Parser");
            File folder = new File(configuration.getPerformanceKitPath()+"/perfkitbenchmarker/linux_benchmarks");

            if(folder.exists()){
                Arrays.asList(folder.listFiles())
                    .stream()
                    .filter((f) -> f.isFile())
                    .filter(f -> !f.getName().endsWith("__init__.py"))
                    .filter(f -> f.getName().endsWith(".py"))
                    .forEach(f -> parseFile(f)
                );
            }
            log.debug("Parser Finished");
            //runner.run("/Users/enat/PerfKitBenchmarker/iperf.yaml", "--ignore_package_requirements", "--openstack_network=bechmarks");
        }

        private void parseFile(File f) {
            log.debug("Parsing File " + f.getName());
            try {
                BufferedReader br = new BufferedReader(new FileReader(f));
                String s = br.readLine();
                String name = "";
                String yml = "";
                Benchmark benchmark = null;
                ArrayList<Flag> flags = new ArrayList<>();
                while (s != null) {
                    if (s.startsWith(NAME_STR)) {
                        name = getValue(s);
                        benchmark =     benchmarkRepository.findOneByBenchmarkName(name);
                        if (benchmark != null) {
                            log.debug(s);
                            log.debug("Found Benchmarf for name" + name );
                        }
                    }
                    if (s.startsWith(CONFIG_STR) && s.endsWith("\"\"\"")) {
                        yml = readYaml(br, s);

                    }
                    if (s.startsWith(FLAG_INTEGER_STR)) {
                        readIntFlag(s, br, flags);
                    }
                    if (s.startsWith(FLAG_ENUM_STR)) {
                        readIntFlag(s, br, flags);
                    }
                    s = br.readLine();
                }

                if (benchmark == null) {
                    benchmark = new Benchmark();

                    benchmark.setName(name);
                    benchmarkRepository.saveAndFlush(benchmark);
                    parseYaml(name,yml,benchmark);
                    Benchmark finalBenchmark = benchmark;
                        final Benchmark finalBenchmark1 = benchmark;
                        flags.forEach(flag -> {
                            flag.setBenchmark(finalBenchmark1);
                            flagRepository.save(flag);
                    });
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        private void readIntFlag(String s, BufferedReader br, ArrayList<Flag> flags) throws IOException {
            String flagStr = s;


            while(!s.endsWith(")")){
                s = br.readLine();
                flagStr += s;
            }
            flagStr = flagStr.replace(FLAG_INTEGER_STR,"");
            flagStr = flagStr.replace("(","");
            flagStr = flagStr.replace(")","");
            String[] token = flagStr.split(",");

            Flag f = new Flag();
            f.setType("INTEGER");
            f.setName(token[0]
                    .replaceAll("\'", "")
            );
            f.setDefaultValue(token[1]);
            if(token.length > 2){
                f.setDescription(token[2].replaceAll("\'", "").trim()
                        .replaceAll("  ", " "));
            }
            if(token.length > 3){
                f.setOtherData(Arrays.toString(token));
            }

            flags.add(f);
        }

        private void parseYaml(String name, String yml, Benchmark benchmark) throws YamlException {
            YamlReader yreader = new YamlReader(yml);

            HashMap<String,Object> parsedYaml = (HashMap<String, Object>) yreader.read();

            //benchmark.setDescription((String) parsedYaml.get("description"));
            HashMap<String,Object> benchmarkSetting = (HashMap<String, Object>) parsedYaml.get(name);
            if(benchmarkSetting != null) {
                HashMap<String, HashMap<String, String>> vmGroup = (HashMap<String, HashMap<String, String>>) benchmarkSetting.get("vm_groups");
                final Benchmark finalBenchmark = benchmark;
                if(vmGroup != null) {
                    vmGroup.forEach((group, map) -> {
                        VMGroup vmGroup1 = new VMGroup();
                        vmGroup1.setBenchmark(finalBenchmark);
                        vmGroup1.setGroupName(group);

                        vmGroupRepository.save(vmGroup1);
                        log.debug("YML PARSE: " + group + "\n" + map.toString());
                        map.forEach((keyname, defaultValue) -> {
                            log.debug(benchmark.getName() + "  => " + keyname);
                            Setting setting = new Setting();
                            setting.setSettingName(keyname);
                            setting.setDefaultValue(defaultValue);
                            vmGroup1.addSetting(setting);
                            settingRepository.save(setting);
                        });
                    });
                }
            }
        }

        private String readYaml(BufferedReader br, String s) throws IOException {
            String yml =  "";
            s = s.replace("\"\"\"","");
            while (s!= null && !s.endsWith("\"\"\"")){
                s = br.readLine();
                if(s!= null && !s.equals("\"\"\"")) {
                    yml += s.replace("*", "");
                    yml += "\n";
                }
            }
            yml = yml.replace("\"\"\"","");
            return yml;
        }

        private String getValue(String tmpStr) {
            String[] token = tmpStr.split("'");
            return token[token.length-1];
        }

}


