import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure ChemicalMasterEquationPackage where
  speciesCount : Nat
  reactionNetwork : Type
  influxRates : Prop
  effluxRates : Prop
  balanceEquations : Prop

structure ChemicalMasterEquationEvidence (C : ChemicalMasterEquationPackage) where
  influxRatesClosed : C.influxRates
  effluxRatesClosed : C.effluxRates
  balanceEquationsClosed : C.balanceEquations

def ChemicalMasterEquationClosed (C : ChemicalMasterEquationPackage) : Prop :=
  C.influxRates ∧ C.effluxRates ∧ C.balanceEquations

theorem chemical_master_equation_closed_from_evidence (C : ChemicalMasterEquationPackage) (E : ChemicalMasterEquationEvidence C) : ChemicalMasterEquationClosed C := by
  exact And.intro E.influxRatesClosed (And.intro E.effluxRatesClosed E.balanceEquationsClosed)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse