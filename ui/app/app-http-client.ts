import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

@Injectable()
export class AppHttpClient {
    private baseUrl = "https://localhost:8443"
    private header = 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNDc5OTAwODYyfQ.XIqJyedqaZwlghdvJbnhfdIrolicP6LhKWVQUybBh4E'

    constructor(private http: Http) { }

    createAuthorizationHeader() {
        let headers = new Headers();
        headers.append('X-Auth', this.header);
        return headers;
    }

    get(url:string) {
        return this.http.get(this.baseUrl + url, { headers:this.createAuthorizationHeader() });
    }

    post(url:string, data:Object) {
        return this.http.post(this.baseUrl + url, data, this.createAuthorizationHeader());
    }
}