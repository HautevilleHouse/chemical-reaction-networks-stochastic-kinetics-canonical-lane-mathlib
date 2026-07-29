import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure ChemicalReactionAdmissibleObject where
  reactionGraph : ReactionGraph
  kinetics : StochasticKineticsEquations
  propensity : PropensityFunctions
  spectralData : FokkerPlanckSpectral
  steadyState : SteadyStateAnalysis
  bridgeClosed : Prop
  gateClosed : Prop

structure ChemicalReactionAdmissibleClass where
  object : ChemicalReactionAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : ChemicalReactionAdmissibleClass) : Prop :=
  (ReactionGraphClosed A.object.reactionGraph ∧
   StochasticKineticsEquationsClosed A.object.kinetics ∧
   PropensityFunctionsClosed A.object.propensity ∧
   FokkerPlanckSpectralClosed A.object.spectralData ∧
   SteadyStateAnalysisClosed A.object.steadyState) ∧
  (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse