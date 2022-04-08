import 'mapper.dart';

abstract class Repository<Model, Domain> {
  final Mapper<Model, Domain> _mapper;

  const Repository(this._mapper);

  Domain toDomain(Model model) => _mapper.toDomain(model);

  Model toModel(Domain domain) => _mapper.toModel(domain);

  List<Domain> toDomainMany(List<Model> models) => _mapper.toDomainMany(models);

  List<Model> toModelMany(List<Domain> domains) => _mapper.toModelMany(domains);
}
