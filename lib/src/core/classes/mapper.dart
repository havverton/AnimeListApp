abstract class Mapper<Model, Domain> {
  Model toModel(Domain domain);
  Domain toDomain(Model model);

  List<Model> toModelMany(List<Domain> domain) => domain.map(toModel).toList();

  List<Domain> toDomainMany(List<Model> model) => model.map(toDomain).toList();
}
