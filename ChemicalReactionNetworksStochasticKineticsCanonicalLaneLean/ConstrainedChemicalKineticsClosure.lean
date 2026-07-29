import HautevilleHouse.ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean.StochasticSimulation
import HautevilleHouse.ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MasterEquationClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  sorry

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedChemicalKineticsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_chemical_kinetics_endgame (A : AdmissibleClass) :
    ConstrainedChemicalKineticsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse