import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure StochasticKineticsPackage where
  rateFunctions : Prop
  stochasticSimulation : Prop
  momentEquations : Prop
  fluctuationDissipation : Prop

structure StochasticKineticsEvidence (K : StochasticKineticsPackage) where
  rateFunctionsClosed : K.rateFunctions
  stochasticSimulationClosed : K.stochasticSimulation
  momentEquationsClosed : K.momentEquations
  fluctuationDissipationClosed : K.fluctuationDissipation

def StochasticKineticsClosed (K : StochasticKineticsPackage) : Prop :=
  K.rateFunctions ∧ K.stochasticSimulation ∧ K.momentEquations ∧ K.fluctuationDissipation

theorem stochastic_kinetics_closed_from_evidence (K : StochasticKineticsPackage) (E : StochasticKineticsEvidence K) : StochasticKineticsClosed K := by
  exact And.intro E.rateFunctionsClosed (And.intro E.stochasticSimulationClosed (And.intro E.momentEquationsClosed E.fluctuationDissipationClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse