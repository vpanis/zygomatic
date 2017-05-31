class RecommendedSkitService
  def find (attr = {})
    # attr = {skit: xxx, user: xxx, nb_of_skits: xxx}
    # real engine to be implemented
    # fake engine used here for demo's sake
    recommended_skits = []
    attr.nb_of_skits.times do
      offset = rand(Skit.count)
      recommended_skits << Skit.offset(offset).first
    end
    recommended_skits
  end
end
