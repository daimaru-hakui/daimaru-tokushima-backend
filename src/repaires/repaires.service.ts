import { Injectable } from '@nestjs/common';
import { Repaire } from './interfaces/repaire.interface';

@Injectable()
export class RepairesService {
  private readonly repaires: Repaire[] = [];
  findAll() {
    return this.repaires;
  }

  findOne(id: string) {
    return id;
  }

  create(repaire: Repaire) {
    this.repaires.push(repaire);
  }
}
