import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  API_URL: string = 'http://localhost:8080/api/products';
  constructor(private httpClient: HttpClient) { }

  getProducts(): Observable<any>{
    const credentials = btoa('user:password'); // credenciales Basic Auth
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Basic ${credentials}`
    });
    return this.httpClient.get(this.API_URL+'/getAllProducts', {headers}).pipe(res => res);
  }

  addProduct(product: any): Observable<any> {
    const credentials = btoa('user:password'); // credenciales Basic Auth
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Basic ${credentials}`
    });
    
    return this.httpClient.post(`${this.API_URL}/createProduct`, product, { headers });
  }

  updateProduct(id: number | string, productData: any) {
    const credentials = btoa('user:password'); // credenciales Basic Auth
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Basic ${credentials}`
    });
    return this.httpClient.put(`${this.API_URL}/updateProduct/`+id, productData,{headers});
  }

  deleteProduct(id: number | string) {
    const credentials = btoa('user:password'); // credenciales Basic Auth
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': `Basic ${credentials}`
    });
    return this.httpClient.delete(`${this.API_URL}/deleteProduct/`+id,{headers});
}
}
