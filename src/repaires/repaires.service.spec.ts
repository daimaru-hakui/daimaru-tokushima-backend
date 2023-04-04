import { Test, TestingModule } from '@nestjs/testing';
import { RepairesService } from './repaires.service';

describe('RepairesService', () => {
  let service: RepairesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [RepairesService],
    }).compile();

    service = module.get<RepairesService>(RepairesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
