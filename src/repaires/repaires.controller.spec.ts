import { Test, TestingModule } from '@nestjs/testing';
import { RepairesController } from './repaires.controller';

describe('RepairesController', () => {
  let controller: RepairesController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RepairesController],
    }).compile();

    controller = module.get<RepairesController>(RepairesController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
