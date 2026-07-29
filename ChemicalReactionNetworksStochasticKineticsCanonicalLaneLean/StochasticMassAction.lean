import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure StochasticMassAction where
  reactionGraph : ReactionGraph
  rateConstants : Type u
  propensityFunctions : Type v
  stochasticDynamics : Prop

structure StochasticMassActionEvidence (M : StochasticMassAction) where
  rateConstantsWellDefined : True
  propensityWellDefined : True
  stochasticDynamicsClosed : M.stochasticDynamics

def StochasticMassActionClosed (M : StochasticMassAction) : Prop :=
  M.stochasticDynamics

theorem stochastic_mass_action_closed_from_evidence (M : StochasticMassAction) (E : StochasticMassActionEvidence M) :
    StochasticMassActionClosed M := by
  exact E.stochasticDynamicsClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse
