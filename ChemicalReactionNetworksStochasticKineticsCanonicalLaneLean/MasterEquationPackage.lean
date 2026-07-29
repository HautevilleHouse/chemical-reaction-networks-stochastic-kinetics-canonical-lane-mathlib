import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure MasterEquationPackage where
  species : Type
  reactions : Type
  stateSpace : Set species -> Prop
  propensityFunctions : Prop
  jumpOperators : Prop
  forwardEquation : Prop

structure MasterEquationEvidence (M : MasterEquationPackage) where
  stateSpaceDefined : M.stateSpace (Set.univ : Set M.species)
  propensityFunctionsClosed : M.propensityFunctions
  jumpOperatorsClosed : M.jumpOperators
  forwardEquationClosed : M.forwardEquation

def MasterEquationClosed (M : MasterEquationPackage) : Prop :=
  M.stateSpace (Set.univ : Set M.species) ∧ M.propensityFunctions ∧ M.jumpOperators ∧ M.forwardEquation

theorem master_equation_closed_from_evidence (M : MasterEquationPackage) (E : MasterEquationEvidence M) : MasterEquationClosed M := by
  exact And.intro E.stateSpaceDefined (And.intro E.propensityFunctionsClosed (And.intro E.jumpOperatorsClosed E.forwardEquationClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse