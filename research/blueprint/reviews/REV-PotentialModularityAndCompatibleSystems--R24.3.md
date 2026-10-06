# Review: Potential Modularity And Compatible Systems, part R24.3 (R24.3–R24.6)

Job: `REV-PotentialModularityAndCompatibleSystems--R24.3`, issue #474. Reviewer: Claude, session `claude-7ftfvb`, 6 October 2026. The blueprint `BP-PotentialModularityAndCompatibleSystems--R24.3` was written by Claude Code session `cc-39fac3` (checkpoints 1–5, PRs #3864, #3869, #3882, #3916, #3923) and completed by Codex session `codex-Hpnayd` (PR #6718). This review is independent of both.

**Verdict: needs_changes.** This is a completed review, not a checkpoint. The plan is careful and mostly faithful, and every defect found in the packet and the suggested file is corrected in place. Three corrections change mathematics:

- `R24.6/residual-members` (ii) denied a result that Khare–Wintenberger prove.
- `R24.5/dieulefait-families` claimed Dieulefait–Pacetti's Theorem 1.11 in a generality its prerequisites do not reach.
- `R24.5/almost-strict-compatibility` lacked two of its inputs.

The verdict rests on one point. The reader document `research/blueprint/readmes/PotentialModularityAndCompatibleSystems--R24.3.md` repeats the packet's text, it is not among this issue's deliverables, and it still states the corrected text, including the two statements above. Promotion would publish that reader as the reviewed document. The revision round therefore only has to bring the reader in line with the corrected packet (section "Required reader synchronisation"). It does not need to redo the plan. The seven recorded gaps and the five stages left `planned` are honest and are not reasons for this verdict.

## Scope, counts and validation

| Item | Result |
| --- | --- |
| Stages | R24.3, R24.4, R24.5, R24.5:operations, R24.6: all `planned`, none `closed`; packet `complete` (one finished pass, PROTOCOL §0) |
| Nodes | 43: 23 verified, 20 corrected, 0 added, 0 unverifiable |
| Kinds | 7 definitions, 8 constructions, 19 theorems, 4 comparisons, 4 lemmas, 1 application |
| API items / unit tests / planets | 85 / 61 / 12 (at most 6 per layer: R24.5:operations has exactly 6) |
| Baseline declarations | 21, all confirmed at Mathlib 082e2d3; none removed |
| Requests | 26; 25 request/prerequisite mismatches reconciled (below) |
| Gaps | 7 (6 inherited, one revised; 1 added) |
| Source issues | E1–E4 confirmed; E5 added and confirmed |
| `check_blueprint.py` (with the pinned declaration index) | 0 errors, 0 warnings |
| `check_errata.check` on the packet's errata projection | no errors |
| Excerpts | every node excerpt found literally in its source's text layer (scripted check after Unicode/whitespace normalisation) |
| Cycles | none: every prerequisite's layer was checked against the atlas graph with all accepted restructurings and link maps |
| Suggested file | `lean-check` at Mathlib 082e2d3: exit 0, no errors, 79 warnings, all "declaration uses sorry" |

## Sources read

All files were downloaded fresh. Their SHA-256 hashes match the packet's records.

- KW I, KW II (author preprints), KW Annals, Böckle's appendix.
- Dieulefait–Pacetti arXiv v2, Snowden arXiv v1, BLGGT arXiv v1 and v4.
- Taylor 2006, Skinner 2009, ACC+ (published layout on Calegari's page, and the Scholze-hosted author copy).
- Khare's level-one paper, arXiv v1.

Two sources were added:

- Dieulefait, arXiv math/0304433v1 (sha256 `164b3f5d…`), the paper DP cite for Theorem 1.11.
- DP's own author copy (sweet.ua.pt, 1 May 2022, sha256 `3d96e2f1…`), identical to arXiv v2 where it matters.

The RACSAM version of DP (117 (2023), 153) could not be obtained: the publisher returned a client challenge. The passages read are listed in each source's `readSections`, in a line marked with this review's job id.

## Baseline

All 21 `baseline.declarations` were opened in the Mathlib source tree at the pinned commit 082e2d37e8b0463410cdb532e111cd43d5a66174. Each exists under the cited name and provides what its consumers use:

- `RingTheory.Sequence.IsRegular`, `IsLocalRing`, `ringKrullDim`, `Module.Flat`.
- `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.Gammaℝ_mul_Gammaℝ_add_one`, which state exactly BLGGT's Γ_ℝ, Γ_ℂ and the duplication identity.
- `Field.absoluteGaloisGroup`, with its Krull topology.
- `Representation`, `Representation.IsSemisimpleRepresentation`, `Representation.IsIrreducible`.
- `Representation.dual` (needs `Group`), `Representation.ind` and `Rep.indResAdjunction` (need `Group` and `CommRing`).
- `NumberField.FinitePlace` and `NumberField.FinitePlace.embedding` (namespace `NumberField`, for any Dedekind R with fraction field K).
- `LinearMap.charpoly` (free finite modules, more general than claimed).
- `MvPowerSeries`, `IsDiscreteValuationRing`, `IsAdicComplete`, `Finsupp`.

No citation was removed. The packet's audit note is accurate: `data/library-coverage.json` has no entry for this roadmap, and no compatible-system carrier exists at either pin.

## Corrections

### Mathematical

1. **`R24.6/residual-members` (ii).** The packet said ρ̄_ι|_{G_{ℚ(ζ_ℓ)}} is absolutely irreducible only for a Dirichlet-density-one set of ℓ, and that "no cofinite conclusion follows". Its own proof step gave the cofinite argument. KW I prove the cofinite statement:
   - Proof of Theorem 10.1, p. 20: "it is easy to see that ρ̄λ is irreducible for almost all λ using the fact that the conductor of ρλ is bounded independently of λ and the Hodge–Tate weights of ρλ are fixed".
   - §8.4, p. 17, uses it: "almost all the residual representations that arise from it are absolutely irreducible".

   (ii) now states KW's result, with its proof. For ℓ ≫ 0 the member is Fontaine–Laffaille crystalline with weights (a, b), and the prime-to-ℓ conductor is bounded, so finitely many pairs of Dirichlet characters can occur. A congruence of traces modulo infinitely many λ is then an equality, and Brauer–Nesbitt applies. For a ≠ b, (ii) adds the cofinite restriction to ℚ(ζ_ℓ), from (v) and KW I Lemma 6.2(ii). The BLGGT density-one theorem is kept for general regular systems.

   The new acceptance check is the Δ family. ρ̄_ℓ is reducible exactly for ℓ ∈ {2, 3, 5, 7, 691}. ρ̄_23 is irreducible but induced from ℚ(√−23) ⊂ ℚ(ζ_23); this is the boundary case ℓ = 2(a − b) + 1 = 23, with weight 12 = (ℓ + 1)/2 as Lemma 6.2(ii) predicts.

2. **`R24.5/dieulefait-families`.** The node stated DP Theorem 1.11 for every lift that is de Rham at p with Hodge–Tate weights {0, k − 1}, and proved it through R23.4. But R23.4 (read in the R23 packet) only covers lifts of KW types (A), (B), (C): crystalline of weight 2 ≤ k ≤ p + 1, crystalline over ℚ_p^nr(µ_p) of weight 2, or semistable of weight 2. The node now:
   - quotes DP's statement;
   - plans exactly the R23.4 scope, which contains the lifts of DP Theorem 1.9(1)–(3) and those of 1.9(4) that are crystalline, Steinberg or of type (B) at p;
   - records the rest as a new gap: weight-two lifts of other potentially Barsotti–Tate types at p, and general regular de Rham lifts.

   DP's almost strict systems require every member to be de Rham at its coefficient prime (Definition 1.10(4)). KW's do not, so the conclusion is reached through the strict upgrade. DP's citation for Theorem 1.11 is source issue E5 (below).

3. **`R24.5/almost-strict-compatibility`.** Two inputs were missing:
   - Step (c) needs a potentially modular field linearly disjoint from ker ρ̄_ι (KW II p. 94, "(iii) d) of Theorem 6.1"). R23.5 is now a prerequisite.
   - Steps (b) (Breuil–Berger) and (c) (Kisin) relied on the R19.5 node. That node keeps Carayol's parity hypothesis, which KW's fields (even degree, no finite discrete-series place) do not meet, and it states neither result. The R19.5 stage, with its precise Skinner request, is now a prerequisite. Skinner's Theorem 1 contains both inputs.

4. **Crystallinity in all weights.** `R24.6/local-compatibility-at-the-coefficient-prime` and `R24.5/strict-brauer-system` cited `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, a criterion for Hodge–Tate weights {0, 1}. They need "a de Rham representation whose WD parameter is unramified with N = 0 is crystalline" in every weight. `PadicHodgeTheory:R06.3/weil-deligne-descent` (b) states exactly that, and replaces it.

5. **`R24.3/theorem-5-1-application-table`.** In KW I §8.2 (pp. 14–15), the mod 5 step and the inductive step each end by lifting the residual member with type (2) or (1), according to case (i) or (ii); the table omitted these. The correspondence with DP Theorem 1.9 is now explicit: DP's (1)–(3) are dyadic and odd-prime instances of KW's (1) and (2), and DP's (4) is Gee–Snowden.

6. **`R24.5/kw-theorem-5-1-systems`.** The node said Savitt is unavailable "at p = 2". KW I p. 19 says Savitt's paper "does not consider the case p = 2" for the residual characteristic of the new member, which is q = 2 in Theorem 5.1(4) notation (§9: p = 3, q = 2).

7. **`R24.3/modern-prescribed-type-lifts`.** Snowden's p is odd throughout (§1.4); the hypothesis is added. The node also now records an unargued step. DP call an inertial type compatible with ρ̄ when one of its lattices reduces to ρ̄|_{I_ℓ}, but Snowden's Theorem 7.2.1 needs a local lift of ρ̄|_{G_{F_v}} of that inertial type and of definite type. Proposition 7.7.1 gives some definite-type lift, not one of a prescribed inertial type.

8. **Smaller statement corrections.**
   - `R24.5/compatible-system`: an almost strictly compatible system is a plain compatible system satisfying the coefficient-place clauses. The old wording could be read as dropping plain compatibility's crystallinity for ℓ ≫ 0.
   - `R24.5/compatible-system-predicates`: "strictly pure" now includes BLGGT's Hodge-symmetry clause.
   - `R24.5/rank-two-reducibility-independent-of-lambda`: the title no longer promises "the component group" (`monodromy-component-field` plans it); the conclusion is absolute reducibility; an unrelated Larsen–Pink hypothesis and two BLGGT sources were removed.
   - `R24.5/constituents-essentially-self-dual`: the hypothesis line said "CM or totally real" (v1) while the statement uses v4's imaginary CM F; they now agree.
   - `R24.3/required-lift-types`: KW's upper-triangular form in type (4) splits over I_q, since χ′ ≠ χ′^q.
   - `R24.3/finite-presentation-complete-intersection`: the hypothesis illustrating finiteness said 𝒪⟦x⟧ is not a complete intersection. It is one; what fails is finiteness, and with it m = n.
   - `R24.3/kw-annals-minimal-lifts`: weight p is excluded also because the R = T inputs of Proposition 3.8 exclude it (KW Annals p. 242).

### Locators and excerpts

- `compatible-system`: the "§5, p. 8" source repeated the p. 7 excerpt; it now quotes the almost-strict definition on p. 8.
- `kw-theorem-5-1-systems`: the "Remark after Theorem 5.1, p. 10" source repeated the theorem's excerpt; it now quotes the Remark.
- `brauer-induction-system`: the Khare locator read "§5, proof of Theorem 5.1". In the arXiv v1 that was read, the argument is §3, proof of Proposition 3.1, pp. 16–17; KW II's "Theorem 5.1 of [33]" is the Duke numbering. The source record and its `sourceVersions` entry were corrected to match.

### Closure bookkeeping

Every request's `neededBy` was compared with the prerequisites of the nodes it names, in both directions. There were 25 mismatches.

Two of them misplaced the early carrier layer:

- `compatible-system` (layer R24.5:operations) was listed as needing AutomorphicGaloisRepresentations R19.3. Under the accepted RS-12, R24.5:operations precedes R19.3, so this would have been a reverse dependency.
- `compatible-system-predicates` was listed as needing WeightsInEtaleCohomology R34.6, which would make a definition depend on an eigenform purity theorem.

Neither node uses those suppliers, so they were removed from those requests. The application table was likewise removed from the R08.6 minimality request.

Prerequisites were added where a node uses what its request names:

- Brauer induction (upstream InductionRestriction Layer 6) for `brauer-induction-system`;
- G7 for `larsen-rational-system-groups`;
- R06.2 for `linear-algebra-operations-on-systems`;
- ClassFieldTheory Layer 11 for `rank-one-purity`;
- R01.1 and R01.5 for `residual-members`.

The remaining `neededBy` lists were completed.

### Other changes

- `weakened-compatible-data`'s `uses` list was a copy of the rank-n carrier's; it now lists the real uses.
- The Larsen test `not_uniform_without_regular` neither matched its name nor tested anything. It is replaced by `theta_bound_depends_on_system`: for ℛ = ε^k over ℚ, θ_l is x ↦ x^{±k}, so C(ℛ) cannot be uniform in ℛ.

## Closure and supplier contracts

Every cross-roadmap node prerequisite was read in its supplier packet:

- R04.3/R04.6 presentation, tangent-space, dimension and factorisation nodes;
- R08.6 local-condition, nonemptiness, away-from-p and endpoint nodes;
- R22.3, R22.5, R22.6 lifting nodes;
- R32.6 transfer nodes;
- R19.4 Carayol and R19.5 coefficient-prime nodes;
- R03.3 regular-local node;
- R06.3/R06.4 WD and Fontaine–Laffaille nodes.

Each supplies what its consumer uses, with the exceptions corrected above (R19.5 node, Barsotti–Tate criterion). The R03.3 node covers only minimal generators of the maximal ideal, and the packet correctly requests the parameter-system statement Böckle's Lemma 2 needs.

The requests are precise. The Skinner request matches Skinner's Theorem 1, pp. 241–243: every v | p, k_i ≥ 2, k_i ≡ w (mod 2), any p, no residual hypothesis.

New layer edges implied by the prerequisites are all acyclic:

- ET.6 → R24.5:operations;
- the upstream ClassFieldTheory, GlobalNumberFields and InductionRestriction layers → R24.5:operations;
- R32.6 → R24.6.

The Brauer genuineness argument was checked in detail:

- BLGGT §5.4(4): dim A ≥ 0 and (A, A) = 1 force A = [V].
- Mackey and Frobenius reciprocity reduce (A_ι, A_ι) to Hom spaces over the overlap fields.
- Both overlap members restrict to the same irreducible family over F, so each Hom space is governed by a character of Gal(F/F_ij). That character is independent of ι by strong multiplicity one for the base-changed forms, which is the precise R17.6 request.

## Red-team findings handed to the blueprint

- **RT-AREA-langlands-2/10.** Right. The generic carrier, predicates and operations are in R24.5:operations, with no eigenform, potential-modularity or potential-automorphy prerequisite. Eigenform families are requested from R19.3 as instances, and purity from R34.6. With the two `neededBy` corrections above, no node of R24.5:operations depends on R19.3 or R34.6; RS-12 (now accepted) adds R24.5:operations → R19.3 and R19.4.
- **/12.** Right. `kw-theorem-4-1` and `alpha-beta-from-residual-modularity` import R22.5/R22.6 and R20.6 and use no R24.1–R24.3 input. This matches KW II §10.2, which invokes Theorem 9.7 and the weight part of Serre's conjecture, not Theorems 6.1 or 10.1. The stage-edge change is recorded in `upstreamNotes` for the maintainer.
- **/21.** Right. Modern ramified, residually reducible transfer is imported from R32.6's three transfer nodes; R24.6 keeps only reduction and local-hypothesis lemmas.
- **/30.** Right. `strict-brauer-system` uses Skinner's full theorem through the R19.5 request and KW's decomposition-field descent. The almost-strict statement is kept as the KW variant. This review also routes the almost-strict proof's coefficient-prime inputs through that request (correction 3).

## Source issues (PROTOCOL §18)

- **E1** (KW II preprint, reference [33], pages 534–567): confirmed. Project Euclid gives Duke Math. J. 134 (2006), no. 3, 557–589.
- **E2** (BLGGT v1 §5.1, Hodge factor undefined for odd w): confirmed. v1 multiplies |h − w/2| linear factors and states the functional equation (Corollary 5.3.2(2)) for all such systems; v4 replaces the factor by Γ-quotients. The elliptic-curve test recomputes Γ_ℂ(s) from v4's formula.
- **E3** (three notational slips in BLGGT v4 pp. 67–70): confirmed; no effect on the arguments.
- **E4** (ACC+ purity remark for systems Artin up to twist): confirmed. Extremely weak systems constrain H_τ only through the determinant, and "Artin up to twist" compares members only. The S₃ family over ℚ(i) with H_τ = {−1, 1}, H_cτ = {0, 0} is a counterexample. The remark is unnumbered, and ACC's main results in §7.1 concern very weakly compatible systems with H_τ = {0, 1}, where the issue does not arise.
- **E5, new** (DP Theorem 1.11, kind gap, affects the proof): confirmed by this review. DP prove Theorem 1.11 by "See [Die04, Theorem 1.1]". In arXiv math/0304433v1, that theorem assumes the lift crystalline at an odd q with Hodge–Tate weights {0, w}, w odd and q ≥ 2w + 1. DP apply 1.11 to lifts outside that range: minimal crystalline lifts of weight k ≤ p + 1 (p = 3, k = 4 gives w = 3 > (q − 1)/2), and weight-two lifts that are not crystalline at p (Paso 1). Those cases are covered by KW II §10.3.2 and Snowden, so DP's main theorem stands. The general statement needs potential modularity of arbitrary regular de Rham lifts.

  Searched: arXiv v1 and v2; the authors' copy; the RACSAM landing page, whose text was refused by the publisher; the Dieulefait arXiv listing, which has only v1; and web searches for an erratum. The finding is scoped to the texts read.

## API, tests, planets and the suggested file

Every definition and construction has an outline that lets a user work without unfolding it: carriers and projections, enlargement and coefficient change, operations with their polynomial and Hodge formulas, preservation and non-preservation relations, recognition up to isomorphism, the Grothendieck ring with pairing, restriction, induction, Brauer and L-functions, and polarization witnesses with sign and multiplier. Each has at least three tests, and the tests were recomputed:

- Δ: Q₂ = X² + 24X + 2048.
- Dual polynomial in rank two.
- Pairings 5, 1 and 10.
- ζ(s), cyclotomic and elliptic-curve Γ- and ε-factors (Γ_ℂ(s), ε_∞ = −1).
- Polarization signs and multipliers: the tensor needs the δ correction, the unit system has multiplier δ.

The 12 planets are key definitions, constructions or named theorems from the sources, with at most six per layer.

The suggested file matches the packet: every packet name occurs, with the active-fragment or omitted status the packet records. The omission catalogue repeats the packet's statements, so it was regenerated from the corrected packet with a script that first reproduced the existing catalogue byte for byte. The renamed test's comment was updated. The active fragments were read one by one; each states a true signature, and each test fragment is true. Examples:

- the Böckle Lemma 2 algebra;
- `dual_charpoly` (the normalised reciprocal polynomial);
- `archimedeanD`;
- `completedRiemannZeta s = Gammaℝ s * riemannZeta s` when Γ_ℝ(s) ≠ 0;
- the polarized-pairing equations.

Several test fragments for objects the baseline cannot state are mere arithmetic checks. They are labelled as such and introduce no surrogate proposition.

## Library audit (item 7)

Nothing the libraries contain is planned as a new node. The carrier, operations and Grothendieck ring are built on `Representation`, `Representation.ind`, `Representation.dual`, `LinearMap.charpoly` and `Finsupp`, which are imported, not redefined. Duplicated mathematics is requested from its owners:

- Brauer induction and Mackey: upstream InductionRestriction;
- Hecke characters: upstream GlobalNumberFields;
- reciprocity: upstream ClassFieldTheory, with a Part II proposal recorded in `restructure`;
- local L- and ε-factors: ET.6;
- eigenform families and coefficient-prime compatibility: R19.3–R19.5.

## Required reader synchronisation

The reader is outside this issue's editable paths. The revision round should copy the corrected packet text into these sections, keeping every identifier:

| Reader section (line in the current file) | Required update |
| --- | --- |
| "Compatible systems: strict, almost strict, and plain" (l. 144) | Two corrected sentences of the statement (almost strict = plain plus clauses; DP's de Rham condition); p. 8 excerpt |
| "Predicates on weakly compatible systems…" (l. 178) | "strictly pure" with the Hodge-symmetry clause |
| "Linear-algebra operations…" (l. 214), "Purity of character systems" (l. 369) | Added prerequisites R06.2, resp. ClassFieldTheory Layer 11 |
| "Very weak and extremely weak compatible data" (l. 115) | Used-by list |
| "Reducibility of rank-2 systems over ℚ…" (l. 522) | New title, "absolute reducibility", hypotheses, sources |
| "Constituents of an essentially conjugate self-dual system" (l. 561) | Hypotheses (imaginary CM F, polarized) |
| "The algebraic groups attached to a rational compatible system" (l. 582) | Prerequisite G7; test `theta_bound_depends_on_system` replaces `not_uniform_without_regular` |
| "Finite plus few relations…" (l. 712) | First hypothesis |
| "Minimally ramified lifts…" (l. 755) | First hypothesis; p. 242 source |
| "Lifts of required type…" (l. 780) | Type (4) sentence |
| "Where the lifts of KW I Theorem 5.1 are used" (l. 902) | Statement (sub-cases of §8.2; DP correspondence); §8.2 source |
| "Weight-two lifts with prescribed types…" (l. 921) | "p odd" in the statement; new hypothesis; §1.4 source |
| "The compatible system through a potentially modular lift…" (l. 991) | Khare locator; Brauer induction prerequisite |
| "The Brauer system is almost strictly compatible" (l. 1027) | Proof steps; prerequisites R23.5 and R19.5 |
| "Strict compatibility of the Brauer system" (l. 1049) | Crystallinity sentence; prerequisite R06.3/weil-deligne-descent |
| "KW I Theorem 5.1: almost strictly compatible systems…" (l. 1066) | Savitt hypothesis (q = 2); Remark excerpt; §9 source |
| "Dieulefait: a given lift lies…" (l. 1090) | Whole statement, hypotheses, sources, acceptance |
| "Residual members of a compatible system" (l. 1113) | Statement (ii), proof step (ii), hypothesis, prerequisites R01.1/R01.5, sources, Δ acceptance |
| "What an almost strict system says at its own coefficient prime" (l. 1137) | Prerequisite R06.3/weil-deligne-descent |
| "Atlas landmarks and coverage" (l. 1180) | R24.5 remaining leaf (new gap) |
| "Supplier contracts" (l. 1205) | "Used by" lists of R01.1, R01.2, R01.5, G7, R06.2, R08.6 (minimality), R19.3, R19.4, R19.5, R34.6 |
| "Source and prototype leaves" (l. 1243) | Revised Dieulefait/Gee gap; new gap on potential modularity outside R23.4 |
| "Freely readable sources and reading scope" (l. 1259) | Khare edition (§3, Proposition 3.1); new Dieulefait 2004 source; reading lines |
| "Version-sensitive source corrections" (l. 1274) | Review verdicts of E1–E4; new E5 |

## Questions for the orchestrator

1. As in the VB0 and VB3 reviews, blueprint review issues cannot edit the reader, although it is promoted with the packet. Could review issues list the reader among their deliverables?
2. ClassicalSerreModularity R33 (the modern route) consumes `dieulefait-families`. Its blueprint should check that every lift it feeds to DP Theorem 1.11 is in the planned scope, or request the missing potential-modularity inputs (new gap).
3. The packet's `upstreamNotes` use `{"where", "note"}` rather than PROTOCOL §10's `{"roadmaps", "note"}`, and two of the three notes concern proposed roadmaps (the R24.4 stage edge, R19.5), not Tau Ceti. The maintainer may want them routed as campaign-edge changes.
4. The R19.5 node `potential-semistability-and-compatibility-at-the-coefficient-prime` still carries Carayol's parity hypothesis. The R19.5 request asks for Skinner's full theorem, which several packets now rely on.

## Node-by-node decisions

The same decisions, with a note for each node, are in the packet's `review.checked`.

| Node | Verdict |
| --- | --- |
| R24.3/bockle-presentation | verified |
| R24.3/finite-presentation-complete-intersection | corrected |
| R24.3/bockle-minimal-r-equals-t | verified |
| R24.3/kw-annals-minimal-lifts | corrected |
| R24.3/required-lift-types | corrected |
| R24.3/theorem-5-1-part-1-minimal-crystalline | verified |
| R24.3/theorem-5-1-part-2-weight-two | verified |
| R24.3/theorem-5-1-part-3-level-one-type-at-q | verified |
| R24.3/theorem-5-1-part-4-level-two-type-at-q | verified |
| R24.3/theorem-5-1-application-table | corrected |
| R24.3/modern-prescribed-type-lifts | corrected |
| R24.4/alpha-beta-from-residual-modularity | verified |
| R24.4/kw-theorem-4-1 | verified |
| R24.5/compatible-system | corrected |
| R24.5/system-operations | verified |
| R24.5/brauer-induction-system | corrected |
| R24.5/almost-strict-compatibility | corrected |
| R24.5/kw-theorem-5-1-systems | corrected |
| R24.5/dieulefait-families | corrected |
| R24.6/residual-members | corrected |
| R24.6/local-compatibility-at-the-coefficient-prime | corrected |
| R24.6/linked-systems-modularity-transfer | verified |
| R24.5/weakly-compatible-system-rank-n | verified |
| R24.5/compatible-system-predicates | corrected |
| R24.5/linear-algebra-operations-on-systems | corrected |
| R24.5/rank-two-reducibility-independent-of-lambda | corrected |
| R24.5/system-l-functions | verified |
| R24.5/galois-grothendieck-ring | verified |
| R24.5/residual-irreducibility-density-one | verified |
| R24.5/constituents-essentially-self-dual | corrected |
| R24.5/larsen-rational-system-groups | corrected |
| R24.5/serre-theta-uniform-bounds | verified |
| R24.5/larsen-good-primes | verified |
| R24.5/strict-brauer-system | corrected |
| R24.5/monodromy-component-field | verified |
| R24.5/polarized-system | verified |
| R24.5/polarized-operations | verified |
| R24.5/character-system | verified |
| R24.5/rank-one-purity | corrected |
| R24.5/induced-character-purity | verified |
| R24.5/artin-system | verified |
| R24.5/artin-twist-purity | verified |
| R24.5/weakened-compatible-data | corrected |
