import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure SteadyStateAnalysis where
  steadyStateDistribution : Type u
  detailedBalance : Prop
  potentialFunction : Type u
  phaseTransition : Prop
  ergodicity : Prop

structure SteadyStateAnalysisEvidence (S : SteadyStateAnalysis) where
  detailedBalanceClosed : S.detailedBalance
  phaseTransitionClosed : S.phaseTransition
  ergodicityClosed : S.ergodicity

def SteadyStateAnalysisClosed (S : SteadyStateAnalysis) : Prop :=
  S.detailedBalance ∧ S.phaseTransition ∧ S.ergodicity

theorem steady_state_analysis_closed_from_evidence (S : SteadyStateAnalysis) (E : SteadyStateAnalysisEvidence S) :
    SteadyStateAnalysisClosed S := by
  exact And.intro E.detailedBalanceClosed
    (And.intro E.phaseTransitionClosed E.ergodicityClosed)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse