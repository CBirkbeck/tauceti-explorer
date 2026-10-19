# DESIGN-MixedHodgeModulesAndIrregularHodgeTheory

Issue #3448. Worker: Codex, session codex-eYL6kd. This is a completed target-planning pass, submitted for independent review, not a checkpoint or an implementation claim.

## Delivered

The roadmap definition, packet, reader and compact suggested Lean file cover all 25 routed items from PAPER-FRESAN-SABBAH-YU-22. There are 60 nodes: 20 constructions, 5 definitions and 35 theorems, with 98 API items, 80 unit tests, 54 planets and 10 cited baseline declarations. Every definition/construction has at least three API items and three tests. The packet status is complete; all implementationStatus fields are unchecked.

All twelve layers are **planned**, none closed: B, D, F, H.0, H.1, E, I, C, P, G, T and N. Each layer's targets have exact statements, hypotheses, sources, proof outlines, acceptance conditions and prerequisite chains. Planning completeness permits the recorded gaps and supplier extensions; it does not establish mathematical or formalization closure.

The reader fixes the left/right filtration, perverse/unshifted degree, Fourier, Tate, normalized monodromy and exponential-weight conventions. It distinguishes the costalk theorem from a stalk statement, retains arbitrary singular zero loci in the tg theorem, and separates unfiltered EMHS Künneth from the additional rationally filtered product comparison. The latter uses Chen–Yu's explicit blowups and finite monomial-generator comparison, rather than assuming that ordinary monoidality proves the filtration formula.

## Closure work

Four direct gaps remain, with the precise statements and resumption instructions in the packet and reader:

1. G1, H.0/curve-l2-hodge: the complete punctured-curve weighted L² domain, self-adjointness and closed-range Hodge theorem in Zucker §§5–7. Compact Hodge theory does not supply it.
2. G2, I/polarized-curve-strictness: the polarized regular twistor Fourier strictness and analytic harmonic-metric input used in Sabbah's Theorem 6.1. Read the invoked Sab05 Theorem 6.1.1 and Sab06 Proposition 4.1/Corollary 5.9 before planning this foundation.
3. G3, T/stationary-phase: the regular eigenvalue-one local Fourier kernel-specialization comparison used by MT Lemma A.4. Read the earlier Sabbah Proposition 4.1(ivb) and establish the maps, sign and Tate translation.
4. G4, N/newton-concentration: the face-graded semigroup/Koszul acyclicity and its commutative-algebra foundation. Read the original Adolphson–Sperber 1997 proof; Yu cites rather than proves this step.

Eleven exact supplier requests are retained. EnhancedDerivedSheaves:E1 supplies the actual Q/C derived sheaf carrier; SchemeAndStackFoundations:SF.0 the complex algebraic/Whitney interface; SF.3 curve completions and Riemann–Roch; SF.4 good graph models, pencils and boundary-compatible weak factorization. The additional SF.2 request covers coherent Čech Künneth, higher-dimensional Serre duality and exceptional relative O(−1) acyclicity; curve Serre duality and étale base change alone do not provide those.

HodgeStructuresPartII:H.0 supplies the Rees/connection comparison, H.2 admissible rational variations, rational polarizations and the algebraic fixed-part theorem, and H.6 relative monodromy and nilpotent-orbit estimates with a residue-sign adapter. Springer H/regular-holonomic needs an explicit specializability/b-function extension: its inspected node defines regularity without proving that theorem. The algebraic toric Layer 0 supplies the lattice/fan/toric carriers and requires the stated normal-fan/refinement bridge; AnalyticToricGeometryPartII:NT.0 requires rounded Newton-pole divisor vanishing. Requests are specifications, not assertions that the additions already exist.

## Ownership

The current TauCetiRoadmap checkout and Tau Ceti library were inspected read-only. Existing linear Hodge structures, mixed strictness and Tate objects are imports. DifferentialGeometry's compact Hodge theory is not the weighted L² result. AlgebraicVectorBundles' connection material is not replanned as a new generic connection theory. The current upstream roadmap audit and distinct pinned commits are recorded in upstreamAudit.

Springer retains its exact generic D-module D and H nodes. This roadmap owns the additional formal curve/index, Betti comparison, Saito Hodge-module, Fourier and exponential interfaces. HodgeStructuresPartII retains variations and nilpotent orbits. The Betti category is not identified with the ℓ-adic perverse categories. No higher-tier theorem is used as a black-box supplier; the Kloosterman companion is a consumer only. Its special polytopes, explicit bases, symmetric-power connections, Jordan blocks and numerical Hodge computations remain with it. Five rescoping proposals record the ownership boundaries without editing another roadmap.

## Sources and findings

Primary references read: the FSY v5 appendix and relevant §2.3/§4.3 arguments; selected Saito 1988/1990 definitions and proofs; Kashiwara's regular Riemann–Hilbert argument; Kontsevich–Soibelman §§4.2/4.4; Esnault–Sabbah–Yu §§1.2/1.6/1.7/2/3 and the needed appendices; Yu §§1/2/4 and Appendix A; Matsui–Takeuchi's Sabbah appendix; Sabbah's polarized Fourier strictness §6; Malgrange exposés XX–XXII; Zucker's local and global L² arguments; Denef–Loeser §§3.3–3.9; and Chen–Yu's filtered Künneth comparison. Dimca was read in the maintainer-cleared reference copy in place. The exact reading boundaries, URLs, versions and hashes are in the source records; no book file, source passage or private path is included.

Six source findings are proposed for independent confirmation. Four FSY convention/wording findings were checked in the Duke journal PDF: the side-change sign, the dual Tate sign, the divisor pullback shift and the zero-function/pushforward distinction. The last two were already recorded by the paper extraction. The KS ambient-weight proof and Yu torus-properness findings are explicitly scoped to the preprints read; no claim is made about the wording of their journal versions. All target statements use the corrections. The original twistor/stationary-phase and Adolphson–Sperber proofs named under the gaps are not represented as read.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MixedHodgeModulesAndIrregularHodgeTheory.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/MixedHodgeModulesAndIrregularHodgeTheory.lean`: elaborated successfully at the pinned shared build; the only warnings are twelve proof placeholders. The initial missing noncomputable marker was corrected before this successful run. Memory was checked before compiling.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/MixedHodgeModulesAndIrregularHodgeTheory.lean`: passed. The file has 81 lines, one light definition with a real body, statements on existing polynomial/Tate carriers and examples; no replacement mathematical carriers or data placeholders.
- Source-issue fields and source-version records checked with the shared errata validation functions; all API/test names checked for uniqueness; all 25 routed items checked; reader/API/test/target correspondence checked.
- Intake deliverable/path/JSON checks and whitespace checks passed before submission.

Independent review should first examine the weight/filtration conventions and the hypotheses of the general Newton and monodromy-at-infinity statements, then the proof boundaries at G1–G4 and the exact supplier additions. Source findings need their own confirmation. Nothing from the scratch directory is needed to resume; its public source versions and resumption locators are recorded in the deliverables.
