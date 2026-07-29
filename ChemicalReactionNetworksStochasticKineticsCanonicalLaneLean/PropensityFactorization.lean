import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure PropensityFactorizationPackage where
  reactionNetwork : Type u
  stoichiometricMatrix : Type v
  massActionKinetics : Prop
  factorizedPropensities : Prop
  complexBalancedCondition : Prop
  deficiencyZeroTheorem : Prop

structure PropensityFactorizationEvidence (P : PropensityFactorizationPackage) where
  massActionKineticsClosed : P.massActionKinetics
  factorizedPropensitiesClosed : P.factorizedPropensities
  complexBalancedConditionClosed : P.complexBalancedCondition
  deficiencyZeroTheoremClosed : P.deficiencyZeroTheorem

def PropensityFactorizationClosed (P : PropensityFactorizationPackage) : Prop :=
  P.massActionKinetics ∧ P.factorizedPropensities ∧ P.complexBalancedCondition ∧ P.deficiencyZeroTheorem

theorem propensity_factorization_closed_from_evidence
    (P : PropensityFactorizationPackage) (E : PropensityFactorizationEvidence P) :
    PropensityFactorizationClosed P := by
  exact And.intro E.massActionKineticsClosed
    (And.intro E.factorizedPropensitiesClosed
      (And.intro E.complexBalancedConditionClosed E.deficiencyZeroTheoremClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse