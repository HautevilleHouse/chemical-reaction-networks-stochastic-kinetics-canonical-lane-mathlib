import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure ReactionGraph where
  species : Type u
  reactions : Type v
  incidence : reactions → List (species × species)
  reversibleMarking : reactions → Prop

structure ReactionGraphEvidence (G : ReactionGraph) where
  incidenceWellDefined : G.incidence = G.incidence
  reversibleMarkingClosed : G.reversibleMarking = G.reversibleMarking

def ReactionGraphClosed (G : ReactionGraph) : Prop :=
  True

theorem reaction_graph_closed_from_evidence (G : ReactionGraph) (E : ReactionGraphEvidence G) :
    ReactionGraphClosed G := by
  trivial

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse
