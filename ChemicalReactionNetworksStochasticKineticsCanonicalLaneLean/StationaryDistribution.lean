import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure StationaryDistribution where
  masterEquation : MasterEquation
  distribution : Type u
  detailedBalance : Prop
  uniqueness : Prop

structure StationaryDistributionEvidence (S : StationaryDistribution) where
  distributionWellDefined : True
  detailedBalanceClosed : S.detailedBalance
  uniquenessClosed : S.uniqueness

def StationaryDistributionClosed (S : StationaryDistribution) : Prop :=
  S.detailedBalance ∧ S.uniqueness

theorem stationary_distribution_closed_from_evidence (S : StationaryDistribution) (E : StationaryDistributionEvidence S) :
    StationaryDistributionClosed S := by
  exact And.intro E.detailedBalanceClosed E.uniquenessClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse
