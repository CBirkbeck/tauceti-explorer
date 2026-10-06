# REV-PerfectoidSpaces--P8: independent review

Reviewer: Claude (Claude Code), session `claude-D8e3bs`. Date: 6 October 2026. Issue:
[#471](https://github.com/CBirkbeck/tauceti-explorer/issues/471).

The plan under review is BP-PerfectoidSpaces--P8 (issue #974). Claude Code session `cc-38267a` wrote the first
pass (PR #2880). Codex session `codex-oxYWsf` completed it (PR #6692). This session wrote none of it.

**Verdict: accepted.** The packet is a complete target-level pass for `PerfectoidSpaces:P8` and
`PerfectoidSpaces:P9`, and both stages are correctly `planned` (neither is `closed`). Every node is verified or
corrected in place. All 55 baseline citations are confirmed, and no contradiction remains in the packet or the
suggested file. Most corrections make the closure more precise: many prerequisites pointed at a whole stage
although the supplier packet already contains the exact node. One supplier was wrong (Huber's category `V`), one
supplier name was retired, and one prerequisite missed the node that states the step. Four gaps and eight
requests remain, all precise.

The reader document `research/blueprint/readmes/PerfectoidSpaces--P8.md` is not a deliverable of this review, so
it was not edited. It now differs from the packet at the points listed under "Reader document" below. Its node
sections should be regenerated from this packet.

## Counts

| | Before | After |
| --- | ---: | ---: |
| Nodes | 66 | 66 (none added or split) |
| Kinds | 5 definitions, 4 constructions, 36 lemmas, 21 theorems | unchanged |
| API items / unit tests / planets | 60 / 37 / 11 | unchanged |
| Baseline declarations | 55 | 55 (all confirmed; 12 descriptions corrected) |
| Prerequisite entries | 293 | 318 |
| Stage-level prerequisites (checker count) | 43 | 21 |
| Requests | 12 | 8 (6 dropped as supplied by existing nodes, 2 added for Tau Ceti AdicSpaces, 4 narrowed) |
| Gaps | 4 | 4 (two restated) |
| Source issues | 34 | 34, all with verdicts: 29 confirmed, 5 rejected |
| `sourceVersions` | 11 | 15 (four earlier arXiv versions read for E6, E13, E16) |

Per-node results in `review.checked`: 36 verified and 30 corrected. Every node keeps
`implementationStatus: "unchecked"`. `python3 scripts/check_blueprint.py` (pinned declaration index): 0 errors,
0 warnings. `research/blueprint/intake.py check-files` on the three deliverables: 0 problems. A recursive
traversal from the 66 nodes through every packet and integrated decomposition reaches 687 node records and finds
no prerequisite cycle.

## Sources

All eleven sources were downloaded again, and each matches the SHA-256 recorded in the packet. This includes
Hansen's author PDF (`davidrenshawhansen.net/adicgpquotient.pdf`), which the author's handoff could not retrieve
and which is available again. The passages read are those named in the node locators.

- **Hansen, *Quotients of adic spaces by finite groups*:** the whole note.
- **Hansen–Johansson:** §5.1 in full (pp. 26–34).
- **CGJ:** §2.1–2.2 (pp. 4–6).
- **KL16:** Theorem 3.3.26 (p. 68), Hypothesis 8.0.1 (p. 158) and Theorem 8.2.3 with its proof (pp. 162–163),
  with Remarks 8.1.2 and 8.1.4.
- **KL15:** Proposition 3.6.9 and Corollary 3.6.18.
- **Scholze, *torsion*:** §II.2 (pp. 13–16) and Theorem IV.1.1 with its proof (pp. 67–69).
- **ECD:** Lemma 2.5, Definitions 5.6–5.10, Theorem 5.8, Definition 10.7, Definition 10.12 and Lemma 10.13,
  Lemmas 11.11 and 11.27, Propositions 11.13 and 11.23, Corollary 11.29, Lemma 12.11 and Proposition 13.6.
- **BS22:** Theorem 1.17, Theorem 7.4 and Remark 7.5, Definition 8.2 and Example 8.3, Theorem 10.11 and
  Lemma 10.12.
- **CHJ:** §§2.5–2.6 (pp. 19–23), §4.1–4.2 (pp. 28–30) and the appendix pp. 48–55.
- **BHW:** §3.1 (pp. 9–11), Definition 3.15 (p. 12) and the proof of Theorem 4.8 (p. 18).

For the citation-numbering findings I also read arXiv:1602.06899v1 and v2 and arXiv:1905.08229v1 and v2. Their
hashes are now in `sourceVersions`.

Every excerpt was located in the text. 82 are verbatim. The other 35 match up to the PDF's rendering of
mathematics (hats, tildes, displayed formulas), and I checked each of these by eye. Locator corrections:

| Node | Was | Now |
| --- | --- | --- |
| `analytically-separated-is-separated`, `analytically-separated-affinoid-intersections` | HJ Lemma 5.5, p. 29 | pp. 29–30 (part (2) is on p. 30) |
| `invariants-of-affinoid-algebra` (CHJ) | Corollary 6.25, pp. 54–55, with an excerpt that does not contain the cited statement | §6.4, opening paragraph, p. 53, with the literal sentence quoting BGR §6.3.3 Prop. 2 |

Hansen quotes the same BGR result as "Prop. 6.3.3/3", while CHJ quote it as "§6.3.3 Proposition 2". BGR is not
public, so the numbering was not checked. The match note says so.

## Baseline

A helper agent opened every declaration in its module at Mathlib `082e2d3` and Tau Ceti `f790474`. I then
spot-checked `Algebra.IsInvariant.exists_smul_of_under_eq`, `AdicCompletion.map_surjective`,
`TauCeti.GaloisDescent.span_invariants_eq_top` and `TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`
myself.

All 55 declarations exist under the cited names in the cited files, and every `kind` is right. Twelve `provides`
descriptions were made precise; each is marked "description corrected by REV-PerfectoidSpaces--P8":

- `exists_smul_of_under_eq` and `stabilizerHom_surjective`: both need `SMulCommClass G A B`, which holds for the
  fixed subring.
- `Module.FaithfullyFlat`: Mathlib proves comonadicity, not an effective-descent theorem.
- `PerfectRing`: characteristic `p` is a separate hypothesis.
- `Sylow`: maximal `p`-subgroups; the index prime to `p` is `Sylow.not_dvd_index`.
- `span_invariants_eq_top`: this is only the spanning half of field descent.
- `completionLocObj`: it is defined per presentation.
- `flat_toCompletionLoc`: `A` must also be complete, separated and Tate.
- `isContinuous_of_forall_le_of_cofinalValue` and `cofinalValue_of_isTopologicallyNilpotent`: both need values
  in a group with zero.
- `rationalSubset` and `spaComap`: the basis and continuity statements are separate lemmas.

No citation was removed, and none is a near miss.

## Corrections

### Closure: exact supplier nodes instead of stages

PROTOCOL §3 says to use the supplier node when one states exactly what is needed. The packet cited whole stages
where the supplier packets already contain such nodes. I read each of the following statements before citing it.

- **DiamondsAndVStacks.**
  - ECD 2.5 is `D0/generalizing-surjection-is-quotient`.
  - ECD 8.7 is `D2/v-descent-of-functions`, and the pro-étale site is `D2/small-pro-etale-site-and-v-site`.
  - ECD 10.12–10.13 is `D3/locally-profinite-torsors`, and v-descent of finite étale maps is
    `D3/etale-and-finite-etale-are-v-stacks`.
  - ECD 11.11 is `D4/isomorphism-criteria-for-v-sheaves-and-stacks`.
  - ECD 11.13 and open subdiamonds are `D4/underlying-topological-space`.
  - ECD 12.11 is `D4/spaces-and-surjectivity-for-small-v-stacks`.
  - ECD 11.23(iii) and limits of spatial diamonds are `D5/limits-and-finite-stage-comparisons`.
  - ECD 11.29 is `D5/quasi-pro-etale-and-fibre-product-permanence`.
  - Spd of a Tate pair is `D6/spd-of-a-tate-pair` and `D6/spd-is-a-spatial-diamond`, and the diamond functor is
    `D6/gluing-and-the-diamond-functor`.
- **ClassicalAdicEtaleCohomology H0.** `H0/huber-tilde-limit` and `H0/tilde-limit-density-rational-restriction`
  are exactly what `closed-loci-in-towers` requested from H0.
- **AdicEtaleGeometry A0.** `A0/rational-pullback-comparison` gives A⟨f/h⟩ = A ⊗̂_{A^G} A^G⟨f/h⟩ for
  `rational-invariants-order-invertible`.
- **AdicSpacesPartII.**
  - R0: `finite-algebra-over-affinoid`, `noetherian-rod-module-complete` and `finite-algebra-tensor-complete`.
  - R1: `analytification-immersions` and `analytification-of-modules`.
  - R5: `coefficient-sheaf-loc`, which is CHJ Proposition 6.16 and is used by `derived-coefficient-change`.
- **PerfectoidSpaces P2, P4, P7.** These nodes are in the PerfectoidSpaces--P0 packet.
  - P2: `fibre-products-over-analytic-base`, which also answers source issue E8.
  - P4: `perfectoid-immersion`, `zariski-closed-immersion`, `universal-perfectoid-zariski-closed`,
    `zariski-closed-base-change` and `separated-perfectoid-map`.
  - P7: `perfectoid-tilde-limit`, `tilde-limit-rational-restriction`, `tilde-limit-base-change`,
    `represented-functor-comparison`, `rational-subsets-from-finite-level` and `compact-open-subgroup-cofinality`.
    The last one also underlies the `tower_not_cofinal` test.

As a result, the requests to D0, D3, D6, H0 and R3 were dropped: their content is all in existing nodes. The
remaining requests were narrowed to what no node states:

- **D2:** finite-group quotient sheaves, and agreement of the pro-étale and v-quotients.
- **D4:** finite-group quotients of diamonds and their restriction to G-stable opens.
- **D5:** ECD Lemma 11.27 and Proposition 13.6.
- **R0:** Weierstrass division by monic polynomials and the intersection of affinoids in a separated rigid space
  are now named, besides the weighted-coordinate and saturated-completion interfaces.

### A misdirected supplier

`categorical-quotient` requested Huber's category `V` from AdicEtaleGeometry A0. A0's stage plans completed
tensor products and fibre products, not `V`. Wedhorn's category `𝒱` is planned in Tau Ceti AdicSpaces §3.4,
and adic spaces as objects of `𝒱` are planned in Layer 5. The node now cites
`tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf` and
`#layer-5-adic-spaces-and-elementary-geometry`, with request entries, as the PerfectoidSpaces--P0 packet does.
The A0 request was dropped.

### The step ν_*Ô_X = O_X

`function-descent-along-tower` uses Scholze's Corollary 6.19 (ν_*Ô_X = O_{X_ét} for smooth X over a discretely
valued field with perfect residue field). PadicHodgeTheory states this exactly as
`P8:local-rational/pushforward-of-structural-de-rham-sheaf` (ii). The packet cited instead
`cohomology-of-graded-structural-de-rham-sheaf`, which only computes the cohomology of gr OB_dR. The exact node
replaces it.

### The retired supplier name for BS22 Theorem 10.11

The gap for `integral-extension-of-perfectoid-pair` named the routed roadmap
`PerfectoidQuotientsPartIIIntegralPerfectoidization`. The confirmed finding RT-PAPER-BHATT-SCHOLZE-22/5 retires
that name: the queue generates one Part II per parent, `PerfectoidQuotientsPartII` ("Perfectoid quotients and
their prismatic prerequisites, Part II"), designed by DESIGN-PerfectoidQuotientsPartII (issue #3362, still
undesigned). The gap, the node's hypotheses and the P8 coverage now use the generated id. The gap itself is
genuine: no installed stage owns BS22 Theorem 10.11, and Q4 owns only the semiperfectoid case.

### Statements, hypotheses and examples

- **`zariski-closed-embedding`.** The gloss "i.e. an injection onto the vanishing locus of an ideal" was weaker
  than HJ Definition 5.4 and ECD Definition 5.7(i). It now reads "a closed immersion (ECD 5.6) whose image is the
  vanishing locus", which is the universal Zariski-closed subspace of torsion II.2.2.
- **`analytically-separated-is-separated`.**
  - A duplicated "(ECD Definition 5.10)" was removed.
  - The proof step now uses ECD's notion of closed immersion.
  - HJ Lemma 5.5(1) itself states separatedness of X^◇ → Spd(K, K⁺), as the node does.
- **`weight-extension-of-function-descent`.**
  - BHW work over a perfectoid field L (§1.5), and R5's product node needs perfectoid base fields. The node let
    L be any complete extension of the discretely valued L₀, so the existence of X ×_{L₀} 𝒰 was unjustified.
    The node now takes L perfectoid and forms X_𝒰 = (X ×_{L₀} Spa L) ×_L 𝒰, with
    `P2/fibre-products-over-analytic-base` as a new prerequisite.
  - Its acceptance item presented BHW Proposition 3.8 as an instance. But 3.8 is a sheaf equality over BHW's
    perfectoid base, so it consumes the gap-dependent `weight-extension-sheaf-equalizer`. The item now says so,
    and a trivial-torsor test was added.
- **`closed-loci-in-towers`.** The torus example needs K perfectoid (for instance ℂ_p) for the limit to be the
  perfectoid torus.
- **`twisted-character-sheaf`.** BHW Definition 3.15 prints the factor as κ⁻¹(c𝔷 + d) in its own normalisation;
  the statement now says so beside CHJ's χ(b𝔷 + d).
- **`invariants-of-completed-tensor-with-banach-space`.** The node now lists the R0 stage, matching its entry in
  the R0 request (weighted and arbitrary-cardinal coordinates).
- **Gap 2 (seminormal base).** The gap now also names Temkin's desingularization (KL II Remark 8.1.2) and rigid
  GAGA (Remark 8.1.4), which the proof of KL II Theorem 8.2.3 uses. No atlas node owns that theorem; I searched
  every packet.

### What was checked and left unchanged

These arguments were checked in detail and found correct:

- the invariant Huber pair (bounded, G-stable rings of definition; the norm pseudouniformizer; (A^G)° = (A°)^G;
  A⁺ is the integral closure of A^{+G});
- the monic-polynomial continuity estimate, which repairs Hansen's Step 1;
- the generalizing and spectral properties of Cont(A) → Cont(A^G);
- the p-group and Sylow steps of KL16 3.3.26, with the coset convention for left actions;
- the CGJ Remark 2.1.4 argument (Lucas: C(p^m k, p^m) ≡ k mod p; injectivity from surjectivity on rank-one
  points);
- the G-clean lemmas and the chart lemma with the orbit-injectivity hypothesis;
- the good-tower quotient (bijectivity on (C, C⁺)-points and nonempty profinite fibres);
- the closed-locus tilde-limit;
- the twisted invariants, the cocycle law and the corrected idempotent;
- the unit approximation, including that the ring-level Lean statement is provable as stated;
- the saturated completed-lattice transfer;
- the integral matrix-coboundary criterion.

I also recomputed these examples:

- the stalk counterexample at the type-five point (μ_{p−1} acting on the closed disc);
- K⟨T⟩^{Z/p} = K⟨T^p − T⟩ in characteristic p;
- the N² = 0 module, whose completion has an invariant that is not a limit of invariants;
- the ℚ_p(√p) sign-twisted lattice;
- the Tate-curve Tor example: H⁰ = 0, H¹ ≅ A/(S) and H⁰(ℒ/S) = ℚ_p;
- the ℤ_p(1)-torus invariants.

## Source issues (PROTOCOL §18)

Every entry was checked at its locator, and each now has a `review` object.

| Issue | Verdict | Check |
| --- | --- | --- |
| E1 | confirmed | HJ footnote 7 itself doubts that π⁻¹(π(x)) is the closure of {x}; a larger stabilizer of π(x) breaks G-cleanness. For taut \|X\|, π is injective on rank-one points. |
| E2, E3 | confirmed | E2: HJ cite Hansen 1.4, whose hypotheses (\|G\| invertible, or a linear action over a perfectoid field) are not among 5.8's. E3 is a missing precision: under the usual convention an action on a rigid space over K is K-linear. |
| E4, E5 | confirmed | Misprints (Y ⊆ X/G; Y_{i_j}). |
| **E6** | **rejected** | HJ's [BS19] is arXiv v1 (May 2019), where Theorem 1.16 is the perfectoidization of integral algebras; v2 agrees. Only v4 renumbered it 1.17. |
| E7, E8 | confirmed | The connected-component step is missing; KL15 3.6.18 is a ℚ_p statement. |
| E9–E12 | confirmed | Hansen's Tate-chart hypothesis; the Cont(A^G) misprint; the invariant pseudouniformizer, integrality and continuity on A; generalizing spectrality asserted without proof. |
| **E13** | **rejected** | In KL16 arXiv v1, which Hansen's 2016 note cites, Theorem 3.3.24 is the invariant-subring theorem. |
| **E14** | **rejected** | Hansen proves the case char K = p, p \| \|G\| on p. 9 by untilting; the roadmap sentence says "(the proof of) Theorem 1.1". |
| E15 | confirmed | With right actions the representatives must be of P∖G. Continuity is implicit in KL's Banach-ring setting. |
| **E16** | **rejected** | In KL16 arXiv v2, Theorem 3.3.25 is the invariant-subring theorem, which is what CGJ cite. |
| E17, E18 | confirmed, known | ECD v4 p. 24 ("The example turned out to be erroneous"); ECD 5.7(ii). The E18 counterexample was checked. |
| E19–E22 | confirmed | KL15 3.6.9(c) is a ℚ_p statement; misprints in ECD p. 25, ECD 10.12 and torsion p. 68. |
| E23 | confirmed | Torsion IV.1.1(i): the integral finite-level statement is asserted ("easy to deduce") without argument. |
| E24–E26 | confirmed | BHW: roles swapped; CHJ 2.23(2) is rational and over ℚ_p; KL II 8.2.3 is for rigid spaces (Hypothesis 8.0.1). |
| E27–E30 | confirmed | CHJ: the idempotent's sign (the printed one fixes the opposite twist); flatness cited from the wrong lemma; ⊗ should be ⊗̂ in Lemma 6.21; Lemma 3.18 gives only almost vanishing. |
| **E31** | **rejected** | CHJ's "locally constant sheaf associated with M_i" is the local system attached through the tower; §4.2 uses the same wording. Nothing in the text uses a constant sheaf. |
| E32, E33 | confirmed | Example: K perfectoid of characteristic p, R⁺ = K°⟨T^{1/p^∞}⟩, I = (T). The perfectoidization of R⁺/(T) is R⁺/⋃_m T^{1/p^m}R⁺, and Σ ϖ^m T^{1/p^m} lies in the closure of that ideal but not in it. So S_perfd[1/ϖ] is not separated and must be completed. This also settles the E33 lead that PerfectoidQuotients' Q4 coverage asks to assess. |
| E34 | confirmed | Products V × U′ are not a basis of Y ×_L U (on the bidisc, \|T − S\| ≤ \|π\| is not a union of products). |

I found no mistake that the packet missed. HJ Lemma 5.5(1) looked like one, but it already says "X^◇ → Spd(K, K⁺)
is a separated map of v-sheaves", so it is not.

## Red-team findings handed to the blueprint (9a)

RT-AREA-padic-1/1 (P8; PerfectoidShimuraVarieties S4 and S2; PerfectoidQuotients Q4; the BS22 routes):

- P8 follows HJ Lemmas 5.9–5.10 in `finite-tower-over-perfectoid-tower` and `integral-extension-of-perfectoid-pair`.
- Hansen 2016 is a source.
- BS22 Theorem 10.11 is a recorded gap, and the gap says why Q4 does not supply it and how to avoid a cycle.
- The S4 and S2 consumers appear in the `uses` of the quotient and closed-embedding definitions.
- The BS22 routes, unreviewed when the finding was written, have since been reviewed. Route 3 sends Theorem 10.11
  to the PerfectoidQuotients Part II, whose generated id the packet now uses.

The packet gets the finding right. The reader still uses the retired name.

## Granularity, API, tests, planets, audit

- **Granularity.** The packet is at target level. Every target of the P8 and P9 stage texts and of the completion
  contracts is a node (the coverage notes map them). Proofs are sketched with sources and are not split into
  lemmas.
- **API and tests.** All nine definitions and constructions have `uses`, API outlines (5–10 items) and four or
  five discriminating tests of every kind.
- **Planets.** P8 has six, the maximum, and P9 has five. All are named from the sources.
- **Library audit.** The reviewed audit (AUDIT-38) finds P8 and P9 "not built". Nothing the libraries contain is
  replanned: ordinary faithfully flat descent is cited as `comonadicExtendScalars`, and fixed-point subrings as
  `FixedPoints.subring`.

## Suggested Lean file

`lean-check research/blueprint/suggested/PerfectoidSpaces--P8.lean` exits with status 0. It prints exactly 70
`declaration uses 'sorry'` warnings and no other message. The shared build has Mathlib `082e2d3` and Tau Ceti
`cf386627`. The Tau Ceti modules the file imports (Huber/Bounded, Huber/Pair, Spa/Comap and their dependencies)
do not differ between `f790474` and `cf386627`; only `Huber/Restricted/TwoSidedSeries` changed.

Every node, API name and test name of the packet occurs in the file. Its stated lemmas and examples were checked
against the packet. For example:

- the left-transversal form of the G-clean characterisation;
- the generalised doubled-origin non-example;
- the twisted average with the corrected sign of E27;
- the ring-level unit approximation;
- the Galois-descent forms.

None is a hollow restatement. The only edits are comments: the category-`V` supplier now reads "Tau Ceti
AdicSpaces 3.4 and 5", the rational-pullback supplier is named exactly, two long lines were wrapped, and the
module documentation says how suppliers are named.

The stand-in `IsPerfectoidTateRing` asks for Frobenius surjective on A°/p together with ϖ^p | p. The P1 node uses
bijectivity of Φ : A°/ϖ → A°/ϖ^p instead. The two agree for complete uniform Tate rings, and the stand-in is
documented as such.

## Reader document

`readmes/PerfectoidSpaces--P8.md` is outside this issue's edit paths and was not changed. Before or at promotion,
regenerate its node sections, requests, gaps and coverage from the reviewed packet. The visible differences are:

- the retired name `PerfectoidQuotientsPartIIIntegralPerfectoidization` (lines 120, 823, 1557 and 1612);
- the prerequisite lists and requests, which still show stages D0, D3, D6, H0, A0 and R3 and the
  `cohomology-of-graded` node;
- the Zariski-closed-embedding gloss;
- the setting of `weight-extension-of-function-descent` (L perfectoid) and its acceptance items;
- the torus example in `closed-loci-in-towers`;
- the CHJ locator of `invariants-of-affinoid-algebra`;
- the "Mistakes found in the sources" table, which should show the verdicts (E6, E13, E14, E16 and E31 rejected).

## Questions for the orchestrator

1. Regenerate the reader document from the reviewed packet, as listed above.
2. The two new requests go to Tau Ceti AdicSpaces Layers 3 and 5 (category `V` and adic spaces as its objects),
   following the PerfectoidSpaces--P0 precedent. Whether requests to Tau Ceti layers should instead go to
   `upstreamNotes` is the maintainer's call. Category `V` is planned there (§3.4), so no atlas roadmap needs to
   own it.
3. When DESIGN-PerfectoidQuotientsPartII (#3362) is written, its node for BS22 Theorem 10.11 should be cited by
   `PerfectoidSpaces:P8/integral-extension-of-perfectoid-pair`. That closes the first gap, and the export to P8
   should include the ϖ-adic completion of E32 and E33.
4. The PerfectoidQuotients packet's Q4 coverage asks for an assessment of E33. This review confirms it, with an
   explicit example, so Q4's remaining item can cite this verdict.
