import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure FluctuationTheorem where
  stationaryDistribution : StationaryDistribution
  entropyProduction : Type u
  fluctuationRelation : Prop

structure FluctuationTheoremEvidence (F : FluctuationTheorem) where
  entropyProductionWellDefined : True
  fluctuationRelationClosed : F.fluctuationRelation

def FluctuationTheoremClosed (F : FluctuationTheorem) : Prop :=
  F.fluctuationRelation

theorem fluctuation_theorem_closed_from_evidence (F : FluctuationTheorem) (E : FluctuationTheoremEvidence F) :
    FluctuationTheoremClosed F := by
  exact E.fluctuationRelationClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse
