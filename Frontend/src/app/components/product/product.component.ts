import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { ProductService } from '../../services/product.service';
import { ProductInterface } from '../../interfaces/product.interface';
import { Router } from '@angular/router';
import  Swal from 'sweetalert2';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';

declare var bootstrap: any;

@Component({
  selector: 'app-product',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  templateUrl: './product.component.html',
  styleUrl: './product.component.css'
})

export class ProductComponent implements OnInit {
  productList: ProductInterface[] = [];
  productFormComponent: FormGroup;
  isDisabled: boolean = true;
  showField: boolean = true;


   @ViewChild('productModal') productModal!: ElementRef;
   modalInstance: any;

  constructor(private productService: ProductService, private router: Router, private fb: FormBuilder)
  { 
    this.productFormComponent = this.fb.group({
      id:[''],
      name: ['', Validators.required],
      price: ['', [Validators.required, Validators.min(0)]],
      description: ['']
    });
  }

  ngOnInit(): void {
    this.getProducts();
  }

  getProducts(){
    this.productService.getProducts().subscribe({
      next: (result) => {
        this.productList = result;
      },
      error:(err) => {
        console.log(err);
      }
    })    
  }  

  openEditModal(product: any) {
    this.showField = true;
    this.productFormComponent.patchValue({
      id: product.id,
      name: product.name,
      price: product.price,
      description: product.description,
    });

    this.modalInstance.show();
  }

  onSubmit() {
    if (this.productFormComponent.valid) {
      const product = this.productFormComponent.value;

      if(product.id)
      {
        this.productService.updateProduct(product.id, product).subscribe({
          next: (res) => {
            Swal.fire({
              title: 'Actualizado',
              text: 'Producto actualizado correctamente.',
              icon: 'success',
              confirmButtonText: 'Aceptar'
            });
            this.productFormComponent.reset();
            this.closeModal();
            this.getProducts(); // refrescar lista
          },
          error: (err) => {
            Swal.fire({
              title: 'Error',
              text: 'No se pudo actualizar el producto.',
              icon: 'error',
              confirmButtonText: 'Aceptar'
            });
          }
        });
      }
      else
      {
        this.productService.addProduct(this.productFormComponent.value).subscribe({
        next: (res) => {
          Swal.fire({
            title: 'Creado',
            text: 'Registro guardado correctamente.',
            icon: 'success',
            confirmButtonText: 'Aceptar'
          });
          this.productFormComponent.reset();
          this.closeModal();
          this.getProducts();
        },
          error: (err) => {
            Swal.fire({
              title: 'Error',
              text: 'No se pudo crear el producto.',
              icon: 'error',
              confirmButtonText: 'Aceptar'
            });
          }
        });
      }
    }
  }

  deleteProduct(id: number | string) {
  Swal.fire({
    title: '¿Estás seguro que desea eliminar el producto?',
    text: 'Esta acción no se puede deshacer',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Sí, eliminar',
    cancelButtonText: 'Cancelar'
  }).then((result) => {
    if (result.isConfirmed) {
      this.productService.deleteProduct(id).subscribe({
        next: () => {
          Swal.fire('Eliminado', 'El producto fue eliminado correctamente.', 'success');
          this.getProducts();
        },
        error: (err) => {
          Swal.fire('Error', 'No se pudo eliminar el producto.', 'error');
          console.error(err);
        }
      });
    }
  });
}


  ngAfterViewInit() {
    this.modalInstance = new bootstrap.Modal(this.productModal.nativeElement);
  }

  openModal() {
    this.showField = false;
    this.productFormComponent.reset();
    this.modalInstance.show();
  }

  closeModal() {
    this.modalInstance.hide();
  }
}
