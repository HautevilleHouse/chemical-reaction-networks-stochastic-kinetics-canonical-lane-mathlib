import HautevilleHouse.ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean.ChemicalMasterEquation

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure StochasticSimulationPackage {N : ReactionNetwork} {M : MasterEquationPackage N}
    (C : ChemicalMasterEquationPackage M) where
  tauLeapMethod : Prop
  gillespieAlgorithm : Prop
  errorBounds : Prop
  weakConvergence : Prop
  strongConvergence : Prop

structure StochasticSimulationEvidence {N : ReactionNetwork}
    {M : MasterEquationPackage N} {C : ChemicalMasterEquationPackage M}
    (S : StochasticSimulationPackage C) where
  tauLeapMethodClosed : S.tauLeapMethod
  gillespieAlgorithmClosed : S.gillespieAlgorithm
  errorBoundsClosed : S.errorBounds
  weakConvergenceClosed : S.weakConvergence
  strongConvergenceClosed : S.strongConvergence

def StochasticSimulationClosed {N : ReactionNetwork} {M : MasterEquationPackage N}
    {C : ChemicalMasterEquationPackage M} (S : StochasticSimulationPackage C) : Prop :=
  S.tauLeapMethod ∧ S.gillespieAlgorithm ∧ S.errorBounds ∧ S.weakConvergence ∧ S.strongConvergence

theorem stochastic_simulation_closed_from_evidence {N : ReactionNetwork}
    {M : MasterEquationPackage N} {C : ChemicalMasterEquationPackage M}
    (S : StochasticSimulationPackage C) (E : StochasticSimulationEvidence S) :
    StochasticSimulationClosed S := by
  exact And.intro E.tauLeapMethodClosed
    (And.intro E.gillespieAlgorithmClosed
      (And.intro E.errorBoundsClosed
        (And.intro E.weakConvergenceClosed E.strongConvergenceClosed)))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse