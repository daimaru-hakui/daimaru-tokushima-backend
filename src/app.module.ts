import { Module } from '@nestjs/common'
import { RouterModule } from '@nestjs/core'
import { AppController } from './app.controller'
import { AppService } from './app.service'
import { ItemsModule } from './items/items.module'
import { RepairesModule } from './repaires/repaires.module'
import { RepaireTemplatesModule } from './repaire-templates/repaire-templates.module'

@Module({
  imports: [
    RouterModule.register([
      { path: 'api', module: RepairesModule },
      { path: 'api', module: RepaireTemplatesModule },
    ]),
    ItemsModule,
    RepairesModule,
    RepaireTemplatesModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
