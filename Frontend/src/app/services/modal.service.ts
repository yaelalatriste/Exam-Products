import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class ModalService {
  private _showModal = new Subject<boolean>();
  
  showModal$ = this._showModal.asObservable();

  openModal() {
    this._showModal.next(true);
  }

  closeModal() {
    this._showModal.next(false);
  }
}