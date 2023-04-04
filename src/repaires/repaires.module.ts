import { Module } from '@nestjs/common';
import { RepairesController } from './repaires.controller';
import { RepairesService } from './repaires.service';

@Module({
  controllers: [RepairesController],
  providers: [RepairesService]
})
export class RepairesModule {}
