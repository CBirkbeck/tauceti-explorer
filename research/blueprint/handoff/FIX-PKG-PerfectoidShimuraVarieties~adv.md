# PerfectoidShimuraVarieties dependency-order fix

Completed by Codex, session `codex-7aqxuz`, for #10216 on 2026-10-17.

## Disposition

The manager's ORDER in #10216 limits this repair to the direction
PerfectoidShimuraVarieties → TorsionCohomologyInfrastructure. The package is
accepted for that repair. No mathematical target or Lean declaration changed.

The named `REV-PKG-PerfectoidShimuraVarieties~adv.md` was absent from both the
checkout and main when checked. The available
[independent package review](../reviews/REV-PKG-PerfectoidShimuraVarieties.md)
was read, including its prior corrections and seven conditional proof inputs.
The issue's explicit ORDER supplies the actionable finding; this report does
not invent additional findings for the missing file.

| Finding | Inspection and change | Result |
| --- | --- | --- |
| Circular supplier direction | The initial README already had no incoming TorsionCohomologyInfrastructure contract, `Needs` edge or proof prerequisite, and Suggested.lean had no reference to it. The scope paragraph's build-order mention was replaced with exact local ownership: Hebbarkeitssatz §§1.3–1.4, good triples and stability §§1.5–1.6, Hasse-chart Hartogs §1.7. | All mentions of the downstream roadmap now occur under Downstream consumers. No absent supplier edge is claimed to have been removed. |
| Ownership of the completed-cohomology comparison | The downstream paragraph now identifies the geometric exports by subsection and places Scholze's Theorem 4.2.1 comparison in the consumer's TC.2, §2.1. CompletedCohomologyPartII §8.6 supplies that comparison's fixed-exponent carrier and support convention. | The comparison consumes the constructed geometry. It is neither a prerequisite nor a target here. |
| Preserve the package outside the order repair | The README span from Layer 0 through the conditional proof inputs is byte-identical to the claimed base; Suggested.lean is byte-identical. | All existing hypotheses, APIs, Checks, worked examples, locators and conditional inputs remain. Review status and this handoff record the disposition. |

No input had to move between roadmaps: the needed geometric inputs were already
owned here. The open upstream PerfectoidQuotients #1042 and ShimuraData #1038
packages were inspected without replacing any contract. CompletedCohomologyPartII
#1035, §8.6 confirms the separate fixed-exponent input to the downstream
comparison. Its coefficient inverse limit is a different construction.

The current TauCetiRoadmap main at
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were consulted read-only, together
with the coverage audit. This repair adds no target that could duplicate them.

## Adversarial pass on the ownership descriptions

The mathematical statements referenced by the edited paragraphs are unchanged.
The following checks verify the scope of those descriptions, rather than claim
a new review of every theorem in the roadmap.

| Statement described | Instances and computation checked | Result and change |
| --- | --- | --- |
| Local characteristic-p extension, §§1.3–1.4 | For I=R, the complement is X and Hom(R⁺,R⁺/t)=R⁺/t. For I=0, the complement is empty and Hom(0,R⁺/t)=0. | The description points to the existing characteristic-p targets; neither ideal case needs a cohomology comparison. No hypothesis changed. |
| Good triples and stability, §§1.5–1.6 | (X,∅,X) gives identity extension and restriction maps. For nonempty X with nonzero sections modulo t, U=∅ makes restriction to zero noninjective. The existing codimension-one negative control excludes unqualified Hartogs extension. | Both the goodness condition and the restrictions on finite covers remain in their local targets. No unrestricted extension assertion was added. |
| Hasse-chart Hartogs, §1.7 | At ε=0, fu=1 gives the completed localization at f. The higher-genus boundary application retains codimension ≥2; genus one does not acquire that hypothesis for free. | The ownership sentence refers to the precise existing target, including its normality and nonzerodivisor assumptions. |
| Normalized trace export, §1.16 | A=K gives identity; A=K×K gives (a+b)/2, so the scalar 1 maps to 1. This also holds over a characteristic-zero 2-adic field. A=0 and characteristic-p division by the degree remain excluded. | The exported normalization retains exactly the nonzero finite-free characteristic-zero hypotheses and the separate analytic tower estimate. |
| Tower, period map and affinoid-basis exports, §§2.4, 2.9, 3.8, 3.13 | In genus one the two projective-line charts and their rational refinements give the stated test basis. The genuine-to-image map is an isomorphism on the interior; no global isomorphism follows. The Siegel construction assumes g≥1. | Subsection references distinguish representability, compactification comparison and the period map. No arbitrary pre-abelian period map or rank-zero Siegel claim was added. |
| Downstream comparison scope | The fixed exponent m=1 is included, as are every m≥1 and i≥0. For p=2 the tame-level condition still requires N≥3 prime to p. A coefficient inverse limit cannot replace the fixed-exponent colimit. | The paragraph follows Scholze, Theorem 4.2.1, pp. 1021–1023 and its §4.2 setup, p. 1020; the Hodge-type embedding and tame-level hypotheses are retained. No degree-zero or ordinary-only restriction was introduced. |

There is no changed Lean signature, variable block, action convention or
normalization. The existing Lean examples were included in the elaboration run;
no new construction or `sorry`-valued data definition was introduced.

## Validation and remaining work

- `lean-check research/blueprint/packages/PerfectoidShimuraVarieties/Suggested.lean`
  exited 0 at the pinned Mathlib `082e2d37e8` / Tau Ceti `f790474` build:
  no errors and only 49 pre-existing `sorry` warnings.
- `scripts/check_sorry_data.py` passed for Suggested.lean.
- `research/blueprint/intake.py check-files` passed for the three changed
  deliverables; `git diff --check` passed.
- The dependency-direction check found exactly one README occurrence of the
  downstream roadmap, under Downstream consumers, and none in Suggested.lean.
  The target-body and Lean byte comparisons against the claimed base passed.
- `scripts/check_blueprint.py` on the unchanged PerfectoidShimuraVarieties
  packet reported seven unresolved ShimuraData prerequisites:
  `D4/hodge-type`, `D4/datum-morphism`, `D5/hilbert-trace-embedding`,
  `D4/shimura-datum`, `D4/adjoint-datum`, `D4/abelian-type` and
  `D4/central-isogeny-lift`. Neither that packet nor its prerequisite index is
  a deliverable of #10216. This is an existing packet/index issue, not a new
  package supplier edge; it was not suppressed or repaired by this change.

No work remains for the specified package ordering repair. The seven existing
conditional mathematical inputs remain implementation prerequisites, as in the
prior review; acceptance here does not certify their proofs. A future packet
maintenance job can reconcile the seven unresolved ShimuraData identifiers
with its upstream package. No scratch file is needed to resume either task.
