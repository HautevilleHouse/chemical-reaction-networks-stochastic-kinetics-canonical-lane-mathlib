import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure MasterEquation where
  stateSpace : Type u
  generator : Type v
  probabilityEvolution : Prop
  stationarityCondition : Prop

structure MasterEquationEvidence (E : MasterEquation) where
  generatorWellDefined : True
  probabilityEvolutionClosed : E.probabilityEvolution
  stationarityConditionClosed : E.stationarityCondition

def MasterEquationClosed (E : MasterEquation) : Prop :=
  E.probabilityEvolution ∧ E.stationarityCondition

theorem master_equation_closed_from_evidence (E : MasterEquation) (Ev : MasterEquationEvidence E) :
    MasterEquationClosed E := by
  exact And.intro Ev.probabilityEvolutionClosed Ev.stationarityConditionClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse
