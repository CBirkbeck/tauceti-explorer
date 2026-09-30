# RT-PAPER-TREUMANN-VENKATESH-16: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4992, job FIX-RT-PAPER-TREUMANN-VENKATESH-16).

**Scope.**
- **Findings:** `RT-PAPER-TREUMANN-VENKATESH-16.result.json`.
- **Verdicts:** `RT-PAPER-TREUMANN-VENKATESH-16.review.json`, by Codex session codex-rtOQ9t. All thirteen findings are
  confirmed. The issue lists the eight medium ones, and this job applies them. The five low findings are not part of
  it; one of them, /12, is the missing `sourceVersions`.
- **Corrections:** where the verifier corrected a fix, I applied its version.

**Files changed.**
- `papers/PAPER-TREUMANN-VENKATESH-16.result.json`.
- `papers/PAPER-TREUMANN-VENKATESH-16.md`, which gets a new closing section.

**Result.** Before and after:

| | Before | After |
|---|---|---|
| Items | 121 (4 library, 15 planned, 102 missing) | 129 (4 library, 14 planned, 111 missing) |
| Routes | 3 | 7 |
| Prerequisites | 8 | 11 |
| Source issues | 53 | 54 |

**Independence.** I did none of:
- the extraction (cc-7b31c4 and cc-39fac3);
- its review;
- the red team (cc-f805bf);
- the verification (codex-rtOQ9t).

**What I read.** The arXiv 1407.2346v1 bibliography (`TV_submit.bbl`), for the prerequisite citations.

## /1 (medium, duplicate): the Frobenius twist and Tate on rings have one owner

- **The owner.** REV-PAPER-FENG-24 gave both to SheafTheoreticSmithTheory, in their general form: the Frobenius twist
  and linearization, and the Tate diagonal with unique extension of characters. That review names items 2 and 26 as
  special cases.
- **The new route.** Items 2 and 26 move from route 1 to a new route 4, joining PAPER-FENG-24 route 1 under the same
  id, title and area. Both items stay missing, as the verifier required: the owner is a proposed roadmap, not a stage.
  Route 4's brief:
  - defers to FENG's brief;
  - names the owned constructions;
  - keeps the vector-space case of the twist, which the verifier said must not be lost.
- **Route 1's brief.** The algebra clause is gone from its Cover list, and the import is added. Its reason says
  SheafTheoreticSmithTheory now plans étale-sheaf Smith theory, while this Part II keeps the topological Smith theory
  of Theorem 4.4.

## /2 (medium, duplicate): nonabelian H¹

- **Item 3** is now planned at `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, whose H¹_cts(G, A) of
  a profinite group acting on a discrete group contains ⟨σ⟩ acting on M.
- **Layer 5's "stretch" label.** Following the verifier, it does not authorize a second construction. Item 3's note
  and route 1's brief say to request the prerequisite from that owner if necessary.
- **The adapter.** The evaluation-at-σ and M⋊⟨σ⟩ descriptions are a separate adapter, `cyclic-h1-descriptions`, in
  route 1.
- **Unchanged:** items 4 and 5.

## /3 (medium, missing): three suppliers of Propositions 5.6 and 8.3

- **`lang-steinberg`: H¹(κ, H) = 0** for smooth connected H over a finite field.
  - It is missing and routed to ReductiveGroupsPartII RG2.3 by a new source route 5, the same request as
    PAPER-LIPNOWSKI-TSIMERMAN-18/lang-theorem.
  - It is not marked planned, because RG2.3's current text does not state it. The verifier drew this distinction.
- **`twisted-class-closed`: the G-class of σ in G⋊⟨σ⟩ is closed** in characteristic 0 (Joyner, Corollary 5.8). It is
  missing, in route 1, and keeps the characteristic-0 and semisimple hypotheses.
- **`stable-borel-pair`: a σ-stable Borel pair containing x.** It is missing, in route 2, with the verifier's
  correction.
  - The setting is characteristic 0, G connected reductive, H = G^σ connected, and x regular semisimple in H.
  - It is not stated in arbitrary characteristic. In characteristic p a unipotent automorphism of order p of SL₂
    stabilizes no Borel pair.
- **Notes.** The notes of items 41 and 68 name these inputs. The paper's prerequisites gain Steinberg's Endomorphisms
  memoir, Steinberg's "Regular elements" and Joyner (J. Lie Theory 10 (2000)).
- **Observation.** The preprint's bibliography entry under the key "SteinbergEndomorphisms" names Steinberg's 1999
  isogeny-theorem paper, not the 1968 memoir the published text cites for §8.9. This is recorded in the
  `stable-borel-pair` note. It is not a new source issue.

## /4 (medium, library-claim): the Hecke algebra and its modules

- **Item 16** keeps library status for:
  - the double-coset algebra and its anti-involution;
  - the case X = G, as it now says. It cites `tauceti:LeftCosetModule.instModuleMulOpposite`, which I read at
    Action.lean:383, alongside Basic.lean:296 and 314.
- **The general module structures** are the new item `hecke-modules-vk-and-kxk`:
  - V^K by the corrected (2.10.2);
  - k[X/K] by (2.10.3), for every right G-set X.

  Following the verifier, it is routed to SR.1 (route 3), not to route 1. SR.1 already plans integral double-coset
  operators by finite correspondences, so no second foundational Hecke action is built.
- **Warning kept.** The note keeps the warning that k[X/K] need not equal k[X]^K.

## /5 (medium, error): four statuses

- **Item 37 (restricted tensor product of Hecke algebras).** It is now missing. Following the verifier, it is
  requested from AF.0, which owns restricted tensor products of adelic test functions, with SR.1's Hecke algebra
  (new source route 6).
- **Item 43 is split.**
  - The consequence for [H]_U (a homeomorphism onto its image) is the paper's own: missing, in route 1.
  - The properness of H(F)\H(A) → G(F)\G(A) for a connected reductive subgroup is the new item
    `reductive-subgroup-properness`. It is requested from AA.3, whose reduction theory it uses (new route 7). Sources:
    Borel–Prasad; Ash, Lemma 2.7; Platonov–Rapinchuk, Lemma 4.15.
- **Item 38 is split** so that each input is isolated, as the verifier asked.
  - The definition, with the integral-domain and Satake description, is planned at RG2.3 and SR.4.
  - "All but finitely many places are good" is the new item `almost-all-places-good`. Its inputs are AA.1's spreading
    out (hyperspecial and unramified), Lang's theorem (quasi-split) and RG2.3. It is routed with AA.1 (route 7).
- **Item 18** stays planned at ALS.1 and ALS.3. The comparison of the singular-chain action (2.10.3) with ALS.3's
  correspondence action is the new item `singular-chain-hecke-comparison`. It is in route 1, and it is added to route
  1's Cover list.

## /6 (medium, error): Theorem 5.8 is for connected reductive G

- **Theorem 5.8 in route 1's brief** now reads "for G connected reductive over a number field F (published §5.5)".
  It adds the compatible archimedean compact and the small-level condition G(F) ∩ K_∞K = 1 of §5.5(d).
- **Theorem 6.5 in route 1's brief** now says "and G semisimple (published p. 203 adds this hypothesis)", with its S
  disjoint from V and from the places above p. The verifier asked for this so that widening 5.8 does not widen 6.5.
- **The summary** says the First Main Theorem is proved for connected reductive G.

## /7 (medium, error): the canonical pseudoroot (b) is inverted

- **Item 59 (b)** now uses cyclo^{-1}∘rec, with rec sending a uniformizer to the arithmetic Frobenius. This is the
  Hecke character sending 𝔭 to N𝔭^{-1}.
  - Its unramified components away from p are |·|_v mod p, so its pullback squares to δ.
  - (9.3.1) stands with arithmetic Frobenius.
- **Verifier corrections.**
  - The components at places above p come from reciprocity, not from reducing the real idelic norm mod p.
  - E54 affects "a stated result", not "nothing": the stated construction is not a pseudoroot in general.
- **New E54 records:**
  - the SL₂, p = 7, v = 3 example;
  - the condition q_v^{2⟨Σ_G,λ⟩} ≢ 1, without claiming failure for every p ≥ 7 or every place;
  - that the examples (p = 2 or 3) are unaffected;
  - that E32 does not reach it.

## /8 (medium, error): the three transfer pairs

For each pair, the §9 item now states the σ-dual construction only, and its "Consequence" sentence is cut.
- **Pair 1:** `rev-exotic-transfer-from-sp-2n` (construction) and `rev-exotic-mod-2-transfer-from` (consequence).
  - The consequence item now requires n ≥ 2. For n = 1, σ(g) = J(g^T)^{-1}J^{-1} = g on SL₂, so σ is trivial.
- **Pair 2:** `rev-mod-2-eisenstein-series-the` (construction) and `rev-mod-2-eisenstein-transfer-from`
  (consequence).
  - The consequence keeps the inverse-Frobenius twist, which removes Frob from the block inclusion, as the verifier
    required.
- **Pair 3:** `rev-transfer-from-sl-3-or` (construction) and `rev-mod-3-transfer-from-a` (consequence).
  - The construction item starts with the full setup, where it used to say "In the situation of the preceding
    Proposition": the form of G₂, σ of order 3, H = G^σ a form of SL₃, T, and the §9.7 Proposition's ψ₁ with
    ψ₁∘Frob.
  - The consequence keeps the Galois action through ϖ_γ and the characteristic-3 embedding.

Each consequence item invokes Theorem 5.8 and the Theorem of §9.1 applied to its construction item's σ-dual
homomorphism, and keeps all its global hypotheses.

## For the maintainer

- **Verdicts.** Record verdicts for the new routes 4–7 in `PAPER-TREUMANN-VENKATESH-16.review.json`, which this job
  may not edit.
- **FENG-24.** Route 4 joins PAPER-FENG-24's proposed SheafTheoreticSmithTheory.

## Checks

- `check_paper.py`: ok. Every missing item is routed exactly once. Items 45 and 56 were planned and on route 3 before
  this fix, and `check_paper.py` accepts that, so I left them.
- `source_issues.check_issues` on the 54 entries: no errors.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 1, UTF-8).
- I did not re-read the paper. Its quotations are the red team's and the verifier's.
