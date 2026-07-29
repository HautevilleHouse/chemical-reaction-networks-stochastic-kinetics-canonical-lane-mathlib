import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

def ConstrainedChemicalReactionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_chemical_reaction_endgame (A : AdmissibleClass) :
    ConstrainedChemicalReactionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse