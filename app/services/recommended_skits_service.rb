class RecommendedSkitsService
  def self.find (attr = {})
    # attr = {skit: xxx, user: xxx, nb_of_skits: xxx}
    # real engine to be implemented
    # fake engine used here for demo's sake
    recommended_skits = []

    if attr[:skit].blank?
      recommended_skits = Skit.order(average_rating: :desc).limit(attr[:nb_of_skits]).to_a
    else
      skit = Skit.find(attr[:skit])
      total_nb_of_recommended_skits = attr[:nb_of_skits]
      nb_of_skits_from_same_comedian = total_nb_of_recommended_skits / 2
      nb_of_skits_from_other_comedians = total_nb_of_recommended_skits - nb_of_skits_from_same_comedian
      recommended_skits = Skit.where(comedian: skit.comedian).where.not(id: skit.id).order(average_rating: :desc).limit(nb_of_skits_from_same_comedian).to_a
      recommended_skits += Skit.where.not(comedian: skit.comedian).order(average_rating: :desc).limit(nb_of_skits_from_other_comedians).to_a
    end

    recommended_skits
  end
end
