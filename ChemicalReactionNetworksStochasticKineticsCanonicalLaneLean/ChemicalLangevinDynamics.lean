import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure ChemicalLangevinEquationPackage where
  concentrationProcess : Type u
  noiseTerm : Type v
  driftTerm : Prop
  diffusionTerm : Prop
  langevinEquation : Prop
  limitValidity : Prop

structure ChemicalLangevinEquationEvidence (L : ChemicalLangevinEquationPackage) where
  driftTermClosed : L.driftTerm
  diffusionTermClosed : L.diffusionTerm
  langevinEquationClosed : L.langevinEquation
  limitValidityClosed : L.limitValidity

def ChemicalLangevinEquationClosed (L : ChemicalLangevinEquationPackage) : Prop :=
  L.driftTerm ∧ L.diffusionTerm ∧ L.langevinEquation ∧ L.limitValidity

theorem chemical_langevin_equation_closed_from_evidence
    (L : ChemicalLangevinEquationPackage) (E : ChemicalLangevinEquationEvidence L) :
    ChemicalLangevinEquationClosed L := by
  exact And.intro E.driftTermClosed
    (And.intro E.diffusionTermClosed
      (And.intro E.langevinEquationClosed E.limitValidityClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse