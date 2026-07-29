import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure StochasticKineticsEquations where
  speciesCount : ℕ
  reactionRateFunctions : Type u
  chemicalMasterEquation : Prop
  langevinApproximation : Prop
  fokkerPlanckEquation : Prop
  stationarityCondition : Prop

structure StochasticKineticsEquationsEvidence (K : StochasticKineticsEquations) where
  chemicalMasterEquationClosed : K.chemicalMasterEquation
  langevinApproximationClosed : K.langevinApproximation
  fokkerPlanckEquationClosed : K.fokkerPlanckEquation
  stationarityConditionClosed : K.stationarityCondition

def StochasticKineticsEquationsClosed (K : StochasticKineticsEquations) : Prop :=
  K.chemicalMasterEquation ∧ K.langevinApproximation ∧
  K.fokkerPlanckEquation ∧ K.stationarityCondition

theorem stochastic_kinetics_equations_closed_from_evidence
    (K : StochasticKineticsEquations) (E : StochasticKineticsEquationsEvidence K) :
    StochasticKineticsEquationsClosed K := by
  exact And.intro E.chemicalMasterEquationClosed
    (And.intro E.langevinApproximationClosed
      (And.intro E.fokkerPlanckEquationClosed E.stationarityConditionClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse