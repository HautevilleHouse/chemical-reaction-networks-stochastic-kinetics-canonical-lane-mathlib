import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure PropensityFunctions where
  massActionPropensity : Type u → Type u
  nonMassActionPropensity : Type u → Type u
  propensityCompatibility : Prop
  taylorApproximation : Prop
  epsilonBound : ℝ

structure PropensityFunctionsEvidence (P : PropensityFunctions) where
  propensityCompatibilityClosed : P.propensityCompatibility
  taylorApproximationClosed : P.taylorApproximation
  epsilonBoundPositive : P.epsilonBound > 0

def PropensityFunctionsClosed (P : PropensityFunctions) : Prop :=
  P.propensityCompatibility ∧ P.taylorApproximation ∧ P.epsilonBound > 0

theorem propensity_functions_closed_from_evidence (P : PropensityFunctions) (E : PropensityFunctionsEvidence P) :
    PropensityFunctionsClosed P := by
  exact And.intro E.propensityCompatibilityClosed
    (And.intro E.taylorApproximationClosed E.epsilonBoundPositive)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse