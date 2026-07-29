import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure ReactionNetwork where
  species : Type u
  reactions : List (List (species × Nat) × List (species × Nat))
  rateCoefficients : reactions → ℝ
  continuousTime : Prop
  massActionKinetics : Prop
  stochastic : Prop

structure NetworkState where
  counts : ReactionNetwork.species → ℕ
  network : ReactionNetwork
  stochastic : network.stochastic
  continuousTime : network.continuousTime
  massActionKinetics : network.massActionKinetics

def StochasticKineticsAdmittedObject (N : ReactionNetwork) : Prop :=
  N.stochastic ∧ N.continuousTime ∧ N.massActionKinetics

def StochasticClosure (A : AdmissibleClass) : Prop :=
  (StochasticKineticsAdmittedObject A.object) ∧ A.endpointSatisfied ∨ A.remainderRecorded

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse