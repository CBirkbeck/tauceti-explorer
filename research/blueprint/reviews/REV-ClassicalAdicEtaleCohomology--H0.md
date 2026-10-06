# Independent review: the classical analytic cohomology inputs to diamonds, H0–H3

Job `REV-ClassicalAdicEtaleCohomology--H0`, issue #367. Reviewer: Claude (Opus 5.5), session
`claude-f1Coxh`, 6 October 2026. This session did not write the input. The planning pass
`BP-ClassicalAdicEtaleCohomology--H0` was written by Claude session `cc-e94dc5` (PR #3281) and Codex
session `codex-M87Gdx` (PR #6697, issue #692).

**Verdict: accepted.** After the corrections below:

- every node is verified, corrected, or added with a justification;
- every baseline citation is confirmed at the pins;
- no contradiction remains.

The packet stays `complete`. Five stages are `planned` (H0, H1:henselian, H1:formal-adic-comparison,
H1, H2) and three are `partial` (H1:valuation-nearby-cycles, H1:valuation-exports, H3), each with a
precise `remaining` list. That is the right coverage: the open proof inputs are recorded as gaps and
requests, not hidden.

The roadmap is planned at target level (distance 8 in `data/roadmap-classification.json`), and it was
reviewed at that level.

## Counts

| Item | Input | After review |
| --- | --- | --- |
| Nodes | 300 | 302 (2 added); 62 verified, 238 corrected |
| Baseline declarations | 170 | 194 (13 `provides` texts corrected, 1 replaced, 25 added) |
| API items / unit tests | 550 / 304 | 582 / 313 |
| Source passages | 728, of which 105 were one- or two-word placeholders | 793, no placeholders |
| Sources | 36 | 38 (Hyodo 1988 and Bloch–Kato 1986 added) |
| Requests / gaps | 37 / 40 | 30 / 44 |
| Source issues | 7 | 15 (E1 rejected; all others confirmed) |
| Restructure proposals | 6 | 7 (one added, two updated) |
| Planets | 40 | 40 (two changed; at most six per layer) |

`check_blueprint.py` reports 0 errors and 0 warnings, both with and without the pinned declaration
index (`TAUCETI_BASELINE` set to the worker baseline). A cycle check over all packets, the integrated
decompositions and the atlas stage edges finds no node-level or stage-level cycle through this
roadmap.

## How the review was done

Every node was checked on these points:

- **Sources:** each excerpt was compared with the text of the cited version, and each locator and
  `match` claim was checked.
- **Mathematics:** statements, tests and acceptance items, with counterexamples where they fail.
- **Closure:** prerequisites against `proofSteps`, cross-roadmap suppliers read in their packets, and
  stage prerequisites replaced by exact supplier nodes where those exist.
- **Definitions and constructions:** API and unit tests.
- **Planets and library audit.**

Sources:

- The public sources were downloaded at the versions the packet records: 29 PDFs, four Göttingen
  (GDZ) OCR texts and 28 Stacks tags.
- arXiv regenerates its PDFs, so their SHA-256 differ from the recorded ones; the cited passages are
  identical.
- Huber's 1996 book is not public. All 125 of its excerpts were matched verbatim, with matching
  locators, against the reviewed decomposition `data/decompositions/ClassicalAdicEtaleCohomology.json`.

Baseline: all 170 declarations were read at Mathlib 082e2d3 and Tau Ceti f790474 in the worker
baseline checkouts.

## Corrections made in place

All corrections are recorded node by node in the `review.checked` list of the packet. The main
classes follow.

### False statements, tests and acceptance items

- **`H0/torsion-sheaf-colimit-of-constructible`:** a sheaf need not be the filtered colimit of its
  constructible *subsheaves*.
  - Counterexample on the closed disc: coker(j_!Λ → Λ) for the open unit disc j has stalk Λ at the
    rank-two point |T| = 1⁻, and no constructible subsheaf reaches that point.
  - Restated as a colimit of constructible sheaves (ECD Lemma 20.4). The same false claim in an API
    item of `classical-constructible-sheaves` is corrected.
- **`H0/etale-restriction-preserves-injectives`:** Γ(U, I) need not be an *induced* Λ[G]-module; it
  is injective, hence G-acyclic.
- **Characteristic-p Kummer tests** (`kummer-sequence`, `tate-twists`): false for perfect K. They now
  require K imperfect, for example 𝔽_p((t)).
- **The disc examples with {|T| ≤ |p|}:** that set is not open in characteristic p, so ϖ replaces p.
- **`H3/curve-duality-perfect-pairing`:** the two dualities were swapped. Poincaré duality gives
  H^{2−q}(X, F^∨(1)) ≅ Hom(H^q_c, ℤ/n); the converse needs finiteness.
- **`H3/smooth-adic-curve` and dependants:** X_η is pro-open, not always open, when C⁺ has infinite
  rank.
- **`H1:valuation-nearby-cycles/strict-localisation-of-a-valuation-ring`:** κ(𝔮) is only normal over
  κ(𝔭); L is its separable part.
- **`H0/analytic-fundamental-group-profinite-quotient`:** π₁ → π₁^alg is not surjective (de Jong
  Remark 2.11(i)). It is now titled as the profinite completion.
- **`H0/preadic-isogeny-local-systems`:** the functor to ℚ_p-local systems is not fully faithful on
  non-quasi-compact X.
- **`formal-bkh-degree-one`:** dropped the bound m < pe/(p−1).
- **"One-point topos" for the empty covering:** this is the degenerate topos, not Set.
- **Also corrected:** two valuation-quadruple tests, two formal-adic acceptance items needing ℓ ≠ p,
  the 3.5.12 "exactly one of (α), (β)" (it is an inclusive or), and the Hensel step for p = 2 in
  `formal-symbols-mod-p-squared`.

### Wrong or unjustified proof steps

Each of these now has a correct argument, or the step is recorded as a gap:

- **H0:**
  - Cartan's criterion was cited from a D0 node that states its converse.
  - The relative Leray sequence needs a Grothendieck spectral sequence; a new request to D0 covers it.
  - f_proét now comes from `AdicSpacesPartII:R4/proetale-site-functoriality`.
- **H1:henselian:**
  - The proof of `tilde-limit-base-change` was circular.
  - Topological invariance in `henselian-pair-universal-homeomorphism-invariance` had no supplier; it
    is replaced by the idempotent argument.
  - `galois-action-on-nearby-cycles` and `milnor-tube-stalk-formula` formed a dependency cycle,
    now broken.
  - The Gabber–Ramero (6.2.18) citation for a transcendental extension is replaced by a Kummer
    argument.
- **H3:**
  - Quasi-compact exhaustion assumed X̄ quasi-compact.
  - Composition, the higher vanishing in the étale case, the rank-one cohomological dimension and
    `curve-cohomology-finiteness` each had a gap.
  - A public route through Zavyalov's Theorem 9.4 is recorded where n is invertible. The rest is the
    new gap "Non-quasi-compact proper-support formalism for arbitrary coefficients".

### Sources

- **Placeholders:** 105 excerpts were placeholders of one or two words: "coherent", "trace",
  "filtration", "covering" and others. Every node of the Česnavičius chain, the Colmez–Dospinescu–
  Nizioł BKH chain, the Zavyalov/Berkovich trace chain and the de Jong lemmas had one. All are now
  literal passages with exact locators, checked against the downloaded texts.
- **49 further locators corrected.** Among them:
  - Berkovich IHÉS 1993: printed page = PDF page + 3, and many pages were one too low.
  - de Jong–van der Put pages.
  - Kedlaya–Liu: preadic spaces are §8.2, and pages differ in v5.
  - Kato: Construction 4.2/4.3 is on p. 17.
  - Wedhorn: §7.5 and §7.6.
  - Bhatt–Hansen, Hansen, ECD (Definition 22.4, Proposition 22.23).
  - Fargues–Scholze: the passage is in the proof of Theorem IV.5.3.
- **Source metadata:** truncated scratch-directory remnants were removed from four `edition` strings
  and from the `searched` lists of E1–E3. The Göttingen URL of Berkovich 1994 is now a plain URL.

### Library audit and baseline

All 170 declarations exist at the pins with the right module and kind.

**Corrected `provides` texts (13).** They overstated the Lean statements. Examples:

- `sheafPullbackConstruction.preservesFiniteLimits` needs `PreservesFiniteLimits G.op.lan`.
- `constantSheaf` is only the functor; the adjunction is `constantSheafAdj`.
- `continuousCohomology` uses iterated cochains.
- `spaLocalizationToRationalSubset` is only the map; the homeomorphism is `spaLocalizationHomeomorph`.

**Replaced (1).** `DerivedCategory.Plus.Qh_map_bijective_of_isKInjective` needs both complexes in K⁺.
It is replaced by `CochainComplex.IsKInjective.quasiIso_iff`.

**Wrong uses fixed (10).** For example:

- `HenselianLocalRing.TFAE` has no étale form; an acceptance item claimed it.
- `ValuationSubring.primeSpectrumEquiv` gives primes ↔ overrings, not convex subgroups.

**Added (25).** These are declarations the nodes used without citing. Among them:

- the Tau Ceti Wedhorn 7.10/7.52 lemmas, `spaLocalizationHomeomorph`, `Valuation.IsMicrobial`,
  `IsProP`, `IsProPSylow.eq_of_normal`, `IsSmoothDiscrete` and
  `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed`;
- Mathlib's decomposition and inertia subgroups, `pointSmallEtale` and its conservativity,
  `IsAdic.isAdicComplete_iff`, `IsDenseSubsite.sheafEquiv` and `Point.Hom`;
- `H0/classical-constructible-sheaves` now uses Mathlib's `Topology.IsConstructible` instead of
  planning `AdicSpace.IsConstructibleSubset` again.

Mathlib's instance `IsAdicComplete.henselianRing` is used in proof text only. The declaration index
omits `instance (priority := …)` lines, so it cannot be a baseline prerequisite.

### Suppliers and requests

**Stage prerequisites replaced by exact nodes**, all read and none creating a cycle:

- AdicEtaleGeometry A1: yoneda-adic, `etale-site-generalized`, `finite-etale-rational-descent`,
  `finite-etale-galois-category`, `etale-diagonal`, `etale-enough-points`, …
- AdicSpacesPartII R0/R1/R2/F0 nodes.
- PerfectoidSpaces P1/P3 nodes.
- `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `…-degeneration` and
  `finite-index-descent`.
- LPV.0/LPV.2 nodes.
- `TropicalAndBerkovichArithmetic:TB.0/spectrum` and `compact-spectrum`.
- The `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity` nodes `curve-trace`, `quasi-finite-flat-trace`,
  `curve-effacement-lemma`, `smooth-effacement`, `affine-space-trace`, `flat-trace` and
  `curve-h1-duality`. These come from the EDC.0 packet merged during this review.

**Wrong suppliers corrected:**

- `AdicSpacesPartII:R1` (analytification of schemes) owns neither Berkovich spaces nor Tate
  uniformization. Those are `TropicalAndBerkovichArithmetic:TB.0` and `TB.7`.
- Invariant lattices belong to `ArithmeticGaloisRepresentations:R01.1`, not `ArithmeticGaloisDuality:R02.1`.
- The ℤ_p-trace limits belong to `EnhancedDerivedSheaves:E2`, not L2.
- Tilting belongs to P3, not P5.
- The α_f coherence is internal to this packet, not D0.

**Requests (37 → 30).**

- *Dropped* because the libraries or exact nodes already supply them:
  - ProfiniteProPGroups layers 2–3 and ProfiniteCohomology layer 0;
  - R02.1 and R02.2;
  - EDC.2 trace-purity and pairings;
  - P5;
  - the D0 hypercover request, which duplicated request 0;
  - the D0 trace-transport request, now split between gap 39 and the E1 request;
  - the R1 algebraization request.
- *Added:*
  - D0: the Grothendieck spectral sequence;
  - TB.7: Tate uniformization;
  - R01.1: invariant lattices;
  - R0: the maximal generalisation of points.
- *Sharpened:*
  - L2, which gains item (D), Hom and D^b_c continuity, per RT-AREA-etale/15;
  - CR.5, with the log point and the base-change charts, and all 11 consumers;
  - SF.2: a garbled self-referential clause rewritten, Mathlib's étale points noted, and a consumer
    added;
  - AdicSpaces layer 4, narrowed to strong noetherianity of complete fields;
  - the R0 preadic and A1 preadic requests, narrowed to what the A1 nodes do not supply;
  - ProfiniteCohomology layer 11, narrowed to the definition of cd_ℓ.

**Gaps (40 → 44).** Four were added:

- Huber's étale site of non-analytic pseudo-adic spaces;
- the Nagata property of finite-type ℤ_p- and 𝔽_p-algebras;
- Berkovich étale cohomology (Ber93 §§4–7), which no packet owns;
- the non-quasi-compact R⁺f_! formalism for arbitrary coefficients.

Several gaps were narrowed (base-change naturality, the integral trace, support-comparison coherence)
or extended (Orgogozo's route now names de Jong [dJ97, 5.10]; the algebraic BKH supplier is
identified as Hyodo 1988 §1).

### Nodes added

- **`H1:formal-adic-comparison/semistable-formal-scheme`** (definition). CDN §2.1.2 and its
  base-change class; the hypothesis class of the whole BKH chain, which no node defined.
- **`H1:formal-adic-comparison/formal-symbol-surjectivity`** (theorem). Symbols generate R^qΨ and the
  U/V filtration is finite and exhaustive (Hyodo (1.6.1), Bloch–Kato (1.4)). This is the form in which
  CDN §2.2 uses Theorem 2.4. The H1 export re-exports it.

### Planets

- **H3:** the planet moves from `pseudo-adic-support-space` to `curve-trace` ("Trace map for smooth
  curves", Hub96 7.2.2, an explicit stage output). `pseudo-adic-support-space` duplicated
  `H0/pseudo-adic-etale-site` and now rests on it.
- **H0:** the analytic fundamental group planet is renamed from the source.

## Red-team findings

- **RT-AREA-etale/15.** Handled correctly. Valuation-base Rj_* constructibility and base change stay
  in H1:valuation-nearby-cycles, with exports in H1:valuation-exports. The L2 request now contains the
  Hom/D^b_c continuity, and `nearby-cycle-cohomology-finiteness`, which needs it, cites L2. The
  GeneralBasesFourier imports are recorded as a restructure proposal.
- **RT-AREA-etale/20.** Handled correctly. `affine-henselian-comparison-3-2-5` states Gabber's
  theorem with the source's hypotheses, now with a torsion definition that includes ℚ/ℤ and the
  RΓ/D⁺ form that importers quote. `fujiwara-comparison-3-2-11` names its comparison map and carries
  an importer acceptance item: the noetherian case of Bhatt–Mathew 6.18 and 6.11.
- **RT-AREA-etale/26.** Resolved more simply than proposed. After review, the twelve perfectoid-limit
  nodes use no P5 node:
  - Česnavičius's stages are noetherian (footnote 3), while P5 assumes perfectoid stages.
  - Their suppliers are H0's colimit-presented tilde-limit nodes and P1/P3 nodes, which
    H1:henselian already imports.
  - The packet therefore induces no P5 → H1:henselian edge. The restructure entry now says the
    suffix split is optional, and the H1:henselian `remaining` list says the same.

## Source issues

| Id | Source | Verdict |
| --- | --- | --- |
| E1 | Scholze–Weinstein Prop. 2.4.2 | **rejected**: SW Definition 2.1.5 defines Spa(A, A⁺) = Spa(Â, Â⁺) for uncompleted and non-sheafy affinoid rings, so the proposition is correct in their framework; the packet's sheafiness is a convention, now said in `huber-tilde-limit-affinoid-criterion` |
| E2 | Scholze, p-adic Hodge theory for rigid spaces, Prop. 3.7(i) | confirmed; the correction overstated the erratum ("only maps … split") and is reworded to its sufficient condition |
| E3 | same, "Proposition 3.8" | confirmed; arXiv v2 numbers it Corollary 3.8 (p. 15), and `printed` now quotes the source |
| E4, E5 | Kato 2011.09880v2 | confirmed; E5's locator corrected (p. 17; Lemma 4.9, p. 21) |
| E6, E7 | ECD Lemma 16.3 proof | confirmed; E7's correction sharpened (local argument on affinoids) |
| E8 (new) | Gabber–Ramero (6.2.18) | misprint "([F′ : K], 1) = 1" for "p" |
| E9, E10 (new) | Kedlaya–Liu Remark 8.4.8 | "integral ⇒ normal" is false (K⟨x,y⟩/(y² − x³)); "[33, §2.6]" names no section of de Jong |
| E11–E13 (new) | Zavyalov, Poincaré duality | two misprints (twist (d) dropped, p. 78; α_f(K), p. 87), and one gap: Ber93 7.2.1 needs u(f) separated of pure dimension, which Appendix A does not supply |
| E14 (new) | Guo–Reinecke Remark 7.17 | asserts without proof that the finite-level traces satisfy the Ẑ_p hypotheses of Theorem 7.16 |
| E15 (new) | ECD Theorem 19.2 | misprint "U′ = V ×_Y Y′" for U ×_Y Y′ |

## Coverage

The `planned` statuses hold: every target of those stages is realised by a node, with proof chains
ending in libraries, supplier nodes, requested stages or recorded gaps.

**H1:valuation-nearby-cycles.** Its first `remaining` item is reworded. Huber's 4.2.4 is itself
dominant-only (Orgogozo Remarque 4.4). The open piece is the stage text's non-dominant case, whose
public route needs de Jong [dJ97, 5.10], which no early stage plans.

**H3.** The first `remaining` item now says that duality over Spa(C, C⁺) with C⁺ ≠ O_C is unproved
even for the relative ball, the case ECD 24.1 uses. Two items are added:

- invariance for proper pushforward with arbitrary torsion coefficients;
- the non-quasi-compact R⁺f_! statements for arbitrary coefficients.

## Suggested Lean file

**Names.** All 895 packet names (582 API items, 313 tests) occur in the file, under 302 node headers
in packet order. No stale test names remain.

**Fixes:**

- Two hollow tests (`extendByZero_test_sheafPullback`, `muN_test_rootsOfUnity`) and the
  `extendByZero_test_adjunction` example, whose packet statement changed, are now honest
  "not stated here" comments.
- `kummer_test_char_p` is restated for a non-p-th power a, which forces K imperfect. The old ring-level
  form did not support the claim for perfect fields.
- Twelve tests stated only through Mathlib carriers are labelled as the Mathlib-level content they
  check.
- The two-sided lattice core is moved under its H0 node.
- `AdicSpace.IsConstructibleSubset` is replaced by the compatibility with `Topology.IsConstructible`.
- The tail's statement, supplier, API and test comments are regenerated from the corrected packet.

**Compilation, with `lean-check` in the shared build (Mathlib 082e2d3):**

- The file as committed stops at its first import: the shared build has no compiled object for
  `TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair`. Four other imported Tau Ceti modules
  (`Spa.Spectral`, `Huber.Padic.Field`, `Valuation.Microbial`, `Spectral.ProConstructible`) also lack
  compiled objects there.
- A scratch copy with those five imports replaced by stubs of the declarations the file uses, with
  signatures copied from Tau Ceti f790474, elaborates with exit code 0, no errors and 354 warnings, all
  "declaration uses `sorry`".
- The file needs no further change for a complete pinned build.

## Questions for the orchestrator

1. **H3 split.** A new restructure entry proposes `H3:smooth-duality` for the 29 general-dimension
   trace and duality nodes. The H4 packet's request asks for exactly this, and it would keep
   DiamondSixOperations S4/S5 off the Berkovich étale cohomology gap. Until it is applied those nodes
   realise H3.
2. **Owners needed:**
   - Berkovich étale cohomology (Ber93 §§4–7). TropicalAndBerkovichArithmetic is the nearest roadmap.
   - De Jong [dJ97, 5.10] in an early stage.
   - The algebraic Bloch–Kato–Hyodo theorem (Hyodo 1988 §1). The existing proposal is an early LPV
     Part II.
   - Huber's étale site of non-analytic pseudo-adic spaces.
   - Mann's extension results behind Zavyalov's Theorem 9.4. Is that theorem acceptable as a
     classical (diamond-free) proof input?
3. **Henselian pair characterisations.** `PerfectoidSpaces:P3/henselisation-of-pairs` and
   `P3/henselian-pairs-colimits-and-completions` use `H1:henselian/henselian-pair-characterisations`
   and the invariance lemmas without a supplier. They cannot cite H1:henselian, because H1:henselian
   imports P3. Should these four nodes move to P3?
4. **Supplier packets to correct when next revised:**
   - `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`
     states SGA 7 XIII 2.1.7.5 as an isomorphism. SGA 7 constructs a morphism and proves isomorphy
     only in 2.1.12.
   - PerfectoidSpaces P7/P8 and AdicSpacesPartII R5 cite `H0/tilde-limits-and-cohomological-continuity`
     or the bare stage where they mean `H0/huber-tilde-limit`.
   - `DiamondEtaleCohomology:C8/prime-to-p-wild-removal` restates part (iii) of
     `H1:valuation-nearby-cycles/prime-to-p-cohomology-through-tame-quotient` and should import it.
   - P5's `spa-of-filtered-colimit-of-tate-pairs` is a special case of `H0/spa-of-colimit-huber-pair`.
5. **H4–H5:**
   - The agreement of the H1 trait composite with the 3.7.2 base change belongs to H5, not H1.
   - Is the proper-only transport of Berkovich 7.4.9 enough for H5's 3.8.1?
6. **Redundancy.** `formal-bkh-non-quasi-compact-descent` repeats what the four BKH theorem nodes
   already assert for every 𝔛. Restrict those to algebraized charts, or drop the descent node.
7. **Stage edge.** H3 now cites two H2 nodes (`proper-pushforward-base-change`). The roadmap's stage
   H3 does not list H2 in `requires`; promotion will induce the edge.
8. **Reader document.** It is not a deliverable of this review, and it no longer matches the corrected
   packet, for example on the perfectoid-limit suppliers, the swapped curve duality, the excerpts, and
   the R1/TB.0 suppliers. It should be regenerated from the packet by a follow-up fix or the assembly
   job.
