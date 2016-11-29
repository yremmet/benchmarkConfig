package de.evoila.benchmarking.benchmark.parser;

import com.esotericsoftware.yamlbeans.YamlException;
import com.esotericsoftware.yamlbeans.YamlWriter;
import de.evoila.benchmarking.data.cloudSetting.InstanceType;
import de.evoila.benchmarking.data.runConfiguration.BenchmarkConfig;
import de.evoila.benchmarking.data.runConfiguration.FlagValue;
import de.evoila.benchmarking.data.runConfiguration.SettingValue;
import de.evoila.benchmarking.data.runConfiguration.VmGroupConfig;
import org.yaml.snakeyaml.Yaml;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by enat on 04/11/2016.
 */
public class BenchmarkConfigSerializer {
    private static final String BECHMARK_CONFIGURATION_PREFIX = "01-";
    private static final String VM_CONFIGURATION_PREFIX = "00-";

    private class YAMLObject{
        ArrayList<HashMap> benchmarks = new ArrayList<>();

    }
    public static String serialize(BenchmarkConfig config) {
        HashMap<String, Object> yamlRootObjekt = new HashMap<>();
        HashMap<String, Object> yamlBenchmarkObjekt = new HashMap<>();
        HashMap<String, Object> yamlVMGroupObjekt = new HashMap<>();
        HashMap<String, Object> yamlFlags = new HashMap<>();
        yamlRootObjekt.put(getBenchmarkKey(config),yamlBenchmarkObjekt);
        yamlBenchmarkObjekt.put("vm_groups", yamlVMGroupObjekt);
        yamlBenchmarkObjekt.put("flags", yamlFlags);
        StringWriter string = new StringWriter(100);
        YamlWriter writer = new YamlWriter(string);

        config.getVmGroupConfigs()
                .stream()
                .forEach( vmGroupConfig -> serializeVmGroupConfig(vmGroupConfig,yamlRootObjekt, yamlVMGroupObjekt));
        config.getFlagValues()
                .stream()
                .forEach( flagValue -> seraializeFlagValue(flagValue, yamlFlags));

        ArrayList benchmarks = new ArrayList();
        HashMap<String, Object> keyValue = new HashMap<>();


        keyValue.put(config.getBenchmark().getName(), yamlBenchmarkObjekt);
        benchmarks.add(keyValue);
        yamlRootObjekt.put("benchmarks", benchmarks);
        try {
            writer.write(yamlRootObjekt);
            writer.close();
        } catch (YamlException e) {
            e.printStackTrace();
        }
        string.flush();
        return string.toString();
    }

    private static void seraializeFlagValue(FlagValue flagValue, HashMap<String, Object> yamlFlagsObject) {
        yamlFlagsObject.put(flagValue.getFlag().getName(), Integer.parseInt(flagValue.getValue()));
     }

    private static String getBenchmarkKey(BenchmarkConfig config) {
        return BECHMARK_CONFIGURATION_PREFIX+config.getBenchmark().getName();
    }

    private static void serializeVmGroupConfig(VmGroupConfig vmGroupConfig, HashMap<String, Object> yamlRootObjekt, HashMap<String, Object> yamlVMGroupObjekt) {
        HashMap<String,Object> vmGroupYaml = new HashMap<>();
        yamlVMGroupObjekt.put(vmGroupConfig.getVmGroup().getGroupName(), vmGroupYaml);
        vmGroupConfig.getSettingValues().stream().filter(settingValue -> settingValue.getSetting().getSettingName().equals("vm_spec")).forEach(settingValue1 -> addInstanceType(settingValue1, yamlRootObjekt, vmGroupYaml));
        vmGroupConfig.getSettingValues().stream().filter(settingValue -> !settingValue.getSetting().getSettingName().equals("vm_spec")).forEach(settingValue1 -> addSetting(settingValue1, vmGroupYaml));

    }

    private static void addSetting(SettingValue settingValue1, HashMap<String, Object> yamlVMGroupObjekt) {
            yamlVMGroupObjekt.put(settingValue1.getSetting().getSettingName(), Integer.parseInt(settingValue1.getValue()));
    }

    private static void addInstanceType(SettingValue settingValue1, HashMap<String, Object> yamlRootObjekt, HashMap<String, Object> yamlVMGroupObjekt) {
        InstanceType instance = settingValue1.getInstanceType();
        HashMap<String,Object> instanceYaml = null;
        if(yamlRootObjekt.containsKey(getVmGroupConfigKey(instance))){
             instanceYaml = (HashMap<String, Object>) yamlRootObjekt.get(getVmGroupConfigKey(instance));
        } else {
            instanceYaml = new HashMap<>();
            HashMap<String, Object> cloudYaml = new HashMap<>();
            instanceYaml.put(instance.getCloud(), cloudYaml);
            cloudYaml.put("machine_type", instance.getFlavour());
            cloudYaml.put("zone", instance.getZone());
            yamlRootObjekt.put(getVmGroupConfigKey(instance), instanceYaml);
        }
        yamlVMGroupObjekt.put(settingValue1.getSetting().getSettingName(), instanceYaml);
        yamlVMGroupObjekt.put("cloud", instance.getCloud());
    }

    private static String getVmGroupConfigKey(InstanceType instance) {
        return VM_CONFIGURATION_PREFIX+String.valueOf(instance.getId());
    }
}
