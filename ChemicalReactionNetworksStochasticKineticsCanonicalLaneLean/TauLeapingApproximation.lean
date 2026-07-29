import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure TauLeapingPackage where
  leapStep : ℝ
  jumpProcess : Type u
  approximationError : Prop
  strongConvergence : Prop
  weakConvergence : Prop
  stepControl : Prop

structure TauLeapingEvidence (T : TauLeapingPackage) where
  approximationErrorClosed : T.approximationError
  strongConvergenceClosed : T.strongConvergence
  weakConvergenceClosed : T.weakConvergence
  stepControlClosed : T.stepControl

def TauLeapingClosed (T : TauLeapingPackage) : Prop :=
  T.approximationError ∧ T.strongConvergence ∧ T.weakConvergence ∧ T.stepControl

theorem tau_leaping_closed_from_evidence (T : TauLeapingPackage)
    (E : TauLeapingEvidence T) : TauLeapingClosed T := by
  exact And.intro E.approximationErrorClosed
    (And.intro E.strongConvergenceClosed
      (And.intro E.weakConvergenceClosed E.stepControlClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse