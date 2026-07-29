import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure PercolationModelPackage where
  networkGraph : Type u
  bondProbability : ℝ
  percolationThreshold : ℝ
  infiniteClusterExists : Prop
  criticalExponents : Type v

structure PercolationModelEvidence (P : PercolationModelPackage) where
  percolationAboveThresholdClosed : P.bondProbability > P.percolationThreshold
  infiniteClusterExistsClosed : P.infiniteClusterExists

def PercolationModelClosed (P : PercolationModelPackage) : Prop :=
  (P.bondProbability > P.percolationThreshold) ∧ P.infiniteClusterExists

theorem percolation_model_closed_from_evidence (P : PercolationModelPackage)
    (E : PercolationModelEvidence P) : PercolationModelClosed P := by
  exact And.intro E.percolationAboveThresholdClosed
    E.infiniteClusterExistsClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse