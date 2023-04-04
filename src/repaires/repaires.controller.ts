import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { RepairesService } from './repaires.service';
import { CreateRepaireDto } from './dto/create-repaire.dto';
import { UpdateRepaireDto } from './dto/update-repaire.dto';

@Controller('repaires')
export class RepairesController {
  constructor(private readonly repairesService: RepairesService) {}

  @Get()
  findAll() {
    return this.repairesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): string {
    return this.repairesService.findOne(id);
  }

  @Post()
  create(@Body() createRepaireDto: CreateRepaireDto) {
    return this.repairesService.create(createRepaireDto);
  }

  @Patch('id')
  update(@Param('id') id: string, @Body() updateRepaireDto: UpdateRepaireDto) {
    return 'update';
  }

  @Delete('id')
  remove(@Param('id') id: string) {
    return `削除${id}`;
  }
}
