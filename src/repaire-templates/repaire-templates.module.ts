import { Module } from '@nestjs/common'
import { RepaireTemplatesController } from './repaire-templates.controller'
import { RepaireTemplatesService } from './repaire-templates.service'

@Module({
  controllers: [RepaireTemplatesController],
  providers: [RepaireTemplatesService],
})
export class RepaireTemplatesModule {}
