import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure MasterEquationPackage where
  stateSpace : Type u
  rateMatrix : Type v
  propensityFunctions : Prop
  transitionRates : stateSpace -> stateSpace -> ℝ
  masterEquation : Prop
  wellPosedness : Prop

structure MasterEquationEvidence (M : MasterEquationPackage) where
  propensityFunctionsClosed : M.propensityFunctions
  transitionRatesClosed : ∀ s t, 0 ≤ M.transitionRates s t
  masterEquationClosed : M.masterEquation
  wellPosednessClosed : M.wellPosedness

def MasterEquationClosed (M : MasterEquationPackage) : Prop :=
  M.propensityFunctions ∧ M.masterEquation ∧ M.wellPosedness

theorem master_equation_closed_from_evidence (M : MasterEquationPackage)
    (E : MasterEquationEvidence M) : MasterEquationClosed M := by
  exact And.intro E.propensityFunctionsClosed
    (And.intro E.masterEquationClosed E.wellPosednessClosed)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse