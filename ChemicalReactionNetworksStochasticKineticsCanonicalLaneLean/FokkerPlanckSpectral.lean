import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure FokkerPlanckSpectral where
  fokkerPlanckOperator : Type u
  eigenvalues : List ℝ
  eigenfunctions : Type u
  spectralGap : ℝ
  relaxationRate : ℝ

structure FokkerPlanckSpectralEvidence (F : FokkerPlanckSpectral) where
  spectralGapClosed : F.spectralGap > 0
  relaxationRateClosed : F.relaxationRate > 0
  eigenvaluesNonNegative : ∀ λ ∈ F.eigenvalues, λ ≥ 0

def FokkerPlanckSpectralClosed (F : FokkerPlanckSpectral) : Prop :=
  F.spectralGap > 0 ∧ F.relaxationRate > 0 ∧ (∀ λ ∈ F.eigenvalues, λ ≥ 0)

theorem fokker_planck_spectral_closed_from_evidence (F : FokkerPlanckSpectral) (E : FokkerPlanckSpectralEvidence F) :
    FokkerPlanckSpectralClosed F := by
  exact And.intro E.spectralGapClosed
    (And.intro E.relaxationRateClosed E.eigenvaluesNonNegative)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse