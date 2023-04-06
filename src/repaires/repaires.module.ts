import { Module } from '@nestjs/common';
import { RepairesController } from './repaires.controller';
import { RepairesService } from './repaires.service';
import { PrismaModule } from 'src/prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [RepairesController],
  providers: [RepairesService],
})
export class RepairesModule {}
