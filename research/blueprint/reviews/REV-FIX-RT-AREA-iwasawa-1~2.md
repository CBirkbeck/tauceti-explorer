# REV-FIX-RT-AREA-iwasawa-1~2

Independent review of FIX-RT-AREA-iwasawa-1~2 (Claude, session `claude-PWOydn`, issue #6216, PR #6753), for
issue #6217.

Reviewer: Claude, session `claude-yM8YCo`, 7 October 2026. I did not write:
- the red team RT-AREA-iwasawa-1 or its verification;
- the first fix round (`RT-AREA-iwasawa-1.fixes.md`) or the fix under review;
- any version of the packet `HeegnerPointEulerSystems--HE.0`, or either of its reviews.

**Verdict: accepted, after two corrections in place in the packet.**

The four confirmed findings that concern this packet, /2, /8, /9 and /10, are correctly fixed. The two source
corrections the fix adds, E9 and E10, are right. My corrections make one request more precise and complete one
description of a stage cycle; no statement, prerequisite or declaration changes. The packet passes its checker. The
suggested file is unchanged and elaborates. The review object of REV-HeegnerPointEulerSystems--HE.0~2 (accepted,
6 October), which this review follows, is now the only entry of the packet's `reviewHistory`.

## What I reviewed

The file under review is `research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`. The job may also edit the
suggested file `research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean`. I read:
- findings /2, /8, /9 and /10 of `RT-AREA-iwasawa-1.result.json`, with their verdicts in `RT-AREA-iwasawa-1.review.json`;
- the fix report `RT-AREA-iwasawa-1.fixes-2.md`, and section /2 of the first round's report for the proposed
  level-raising stage;
- the fix commit's diff (05036608) of the packet, the reader and the suggested file. The packet on `main` is identical
  to that commit. I compared every changed field node by node. The fix changed ten declarations, five gaps, six
  structure proposals, three coverage lines, the summary and the audit records. It rewrote nine requests, withdrew
  three and added two, and it added two source corrections and two sources;
- the statements of all the supplier declarations the fix cites (see "Suppliers");
- the earlier review report `REV-HeegnerPointEulerSystems--HE.0~2.md`, for what had already been accepted.

The red team has 36 confirmed findings. The other 32 concern blueprints this packet does not cover. Their hand-off
table in the fix report is outside this review.

## Sources

All six were downloaded again. The four that the packet records reproduce its SHA-256 values. Elkies and Manoharmayum
are evidence for E9 only and are not packet sources.

| Source | Passages read | SHA-256 |
|---|---|---|
| [Zhang, Camb. J. Math. 2 (2014), version of record](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf) | Notations (i)–(xv), pp. 200–203; §2 with Theorem 2.1 and proof, pp. 203–204; Lemma 3.3, p. 215; (4.6)–(4.9), pp. 218–219; §6.3 with (6.7) and Lemma 6.3, p. 228; Theorem 6.4 and proof, pp. 229–230; proof of Theorem 6.5, p. 231; §7.1 to the end of the proof of Theorem 7.2, pp. 231–234; Theorem 1.1's hypotheses, p. 195; references | `698eb8a6…92ec` |
| [Howard, arXiv:1202.6340v1](https://arxiv.org/pdf/1202.6340v1) | Theorems A and B, pp. 2–3; Definition 1.2.3, p. 7; §1.6 opening and Theorem 1.6.1, p. 16; end of the proof of 1.6.1 and Theorem 1.6.5 with proof, pp. 18–19; §1.7 opening; Theorem 1.7.5, p. 21; Proposition 2.1.3 and proof, pp. 23–24 | `d2d06e85…ea9a` |
| [Skinner, arXiv:1407.1093v1](https://arxiv.org/pdf/1407.1093v1) | Introduction with Theorems A, B, C and footnote 1, pp. 1–3; §2.5 with Conjecture 2.5.1, Theorem 2.5.2 and the discussion of hypothesis (*), pp. 15–16; opening of §3.2, pp. 20–21 | `02d176d8…b988` |
| [Zanarella, arXiv:1908.09197v1](https://arxiv.org/pdf/1908.09197v1) | §2.3: Lemma 2.3.1, Definition 2.3.2, Propositions 2.3.3–2.3.4, Remark 2.3.5, Theorem 2.3.6 with proof, pp. 18–20; the statement of §2.4's specialisation | `00d91f8d…312f` |
| [Elkies, arXiv:math/0612734v1](https://arxiv.org/pdf/math/0612734) | Abstract and introduction, pp. 1–2 | `3da8cfeb…924a` |
| [Manoharmayum, arXiv:1304.1196v2](https://arxiv.org/pdf/1304.1196v2) | Abstract and Main Theorem, p. 1 | `67012803…9a84` |

I also queried the LMFDB API for the curve 1944.f1 (`ec_curvedata`, `ec_galrep`, 7 October 2026).

The three excerpts the fix added were compared with the text layers. All three are literal: Zhang p. 203 ("recall the
level-raising of Ribet, following Diamond–Taylor"), Zanarella p. 20 ("with equality if and only if κ is
primitive") and Skinner p. 15 ("a closer reading of the proof of loc. cit. shows that all that is necessary is that
(a) ρ̄f be irreducible"). Their locators are right.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json` with the
  pinned declaration index gives 0 errors and 0 warnings, before and after my corrections. The packet has 78 nodes,
  63 requests and 21 gaps.
- `check_issues` and `versions_checked` of `scripts/check_errata.py`, run on the packet's ten source corrections and
  24 version receipts, report no problems.
- `python3 research/blueprint/intake.py check-files` on the packet and the suggested file reports 0 problems.
- `lean-check research/blueprint/suggested/HeegnerPointEulerSystems--HE.0.lean` (`lake env lean` in the shared build
  at Mathlib `082e2d3`) exits 0 with no errors. All 114 warnings are unproved declarations. The file's SHA-256 is
  `89ba2888…1625`, as the packet's verification record says. I did not edit it. Its seven changed comments repeat
  the seven changed statements word for word, and no name or signature changed.
- The reader `research/blueprint/readmes/HeegnerPointEulerSystems--HE.0.md` contains, up to whitespace, every node
  statement, every proof step, every request, every gap and every structure proposal of the packet as the fix left it.
- Graph claims, checked by script over every packet in `research/blueprint/packets/` and the stage graph of
  `data/atlas.json`:
  - The 13 declarations the `split` proposal assigns to HE.6z and the six it leaves in HE.6 are exactly the 19
    HE.6 declarations.
  - No declaration outside HE.6z, in any packet, has a prerequisite in HE.6z.
  - Every HE.6z declaration lies in the prerequisite closure of `zhang-indivisibility`.
  - No HE.6z declaration reaches an HE.6-proper declaration.
  - The cross-roadmap stages that HE.6z declarations cite directly are exactly the list in the proposal:
    - R20.2, R17.3 and R18.3;
    - ModularIwasawaMainConjectures L1, KatoEulerSystems L4, and SelmerIwasawaCohomology L1 and L4;
    - GZ.0, GZ.3, GZ.5 and R11.4;
    - ES.1, ES.3 and R02.2;
    - Tau Ceti Chebotarev layer 10, and BSD.3a under BSD.5.
  - Of HE.6z's supplier stages, only ModularIwasawaMainConjectures:L1 is reachable from HE.8. No supplier stage of
    HE.6 proper is.
  - None of the 60 declarations of HE.8, HE.8b and HE.8c in `HeegnerPointEulerSystems--HE.7s` has a prerequisite,
    direct or indirect, in HE.6.
  - The prerequisite closure of `RankZeroOneBSD:BSD.3a/definite-congruence-period` contains no
    HeegnerPointEulerSystems node.
  - R17.5 → HE.6 is still an atlas edge, and the RS-21 link from InductionRestriction layer 7 to HE.6 is in
    `data/restructure/RS-21.result.json`, as the fix says.

## Suppliers

| Cited declaration | Packet and state | Read against the use |
|---|---|---|
| `EulerSystemsAndKolyvaginSystems:ES.5/howard-hypotheses` | ES.0, partial, review needs_changes | Howard's Selmer triples, Kolyvagin systems twisted by G_n, H.0–H.5 as printed in §1.3 |
| `…:ES.5/howard-dvr-theorem` | same | Howard Theorem 1.6.1 with 𝓛_s(T) ⊆ 𝓛, over a DVR, with conclusion D ⊕ M ⊕ M and the length bound |
| `…:ES.5/divisibility-invariants` | same | Mazur–Rubin's invariants and primitivity, for Mazur–Rubin systems over ℚ (see correction 1) |
| `…:ES.8/self-dual-lambda-adic-kolyvagin-bound` | ES.8, accepted | Howard Theorem 2.2.10 with its inputs as hypotheses (named in the structure proposal only) |
| `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `/multiplicity-one` | R17.3, accepted | Global JL for any quaternion algebra over a number field, and multiplicity one; no integral statement. `/definite-infinity` assigns the algebraic form space to R18.3, as the new request says |
| `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond` | partial, not reviewed | Diamond's criterion (Ribet, Theorem 5.1): a form whose newform has level divisible by q; neither exact level Nq nor prescribed local types |
| `KatoEulerSystems:L4/ordinary-selmer-divisibility` | complete, review needs_changes | Kato Theorem 17.4; its integral part (3) assumes (12.5.2), the large-image condition |
| `RankZeroOneBSD:BSD.3a/definite-congruence-period` | BSD.0, partial, review needs_changes | The identity, with t_g(ℓ) written over ℚ_ℓ, a nonsquarefree statement and Pollack–Weston's squarefree route; parent stage BSD.5 |
| `AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image` | accepted | A cited leaf: open image at every p for geometric End = ℤ and g odd or g ∈ {2, 6}; its proof is a recorded gap |
| `GL2ModularityLifting:R22.1/prescribed-level-raising-step`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic` | not accepted | As the gap describes them: KW II's quaternionic step over totally real fields, and Ihara's lemma for definite quaternionic forms |

Several cited declarations belong to packets not yet accepted. PROTOCOL.md section 3 says to cite a node that supplies
the statement, and the coverage lines and the gap on supplier scope say which packets are pending. Promotion derives a
stage link only from a node it can place. The link ES.5 → HE.5, which the accepted packet derived from its stage
prerequisite, is therefore absent until the ES.0 packet is promoted. The atlas has no other edge or path from ES.5 to
HE.5. The fix records this in `verification.redTeamFix.graph.derivedLinks`.

## /10 (medium, missing): Howard's self-dual theory needs one owner. Correctly fixed.

The owner now exists in ES.5, and the packet cites it.

- **The hypothesis nodes.** `HE.5/actual-tate-hypotheses-h0-h2` and `actual-local-hypotheses-h3-h5` verify H.0–H.2 and
  H.3–H.5 of `ES.5/howard-hypotheses`. The ES.5 statement has Howard's hypotheses as printed, including H.2 with
  F ⊇ K and H.4's twisted pairing. The verification follows the proof of Howard's Theorem 1.6.5 (p. 18), which derives
  H.1 and H.2 from the surjectivity onto Aut(T_pE), H.3 from propagation, H.4 from the Weil pairing and H.5 from E
  being defined over ℚ.
- **The corrected system.** `HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system` now ends with a
  Kolyvagin system in the sense of the ES.5 record. That is Howard's Theorem 1.7.5 (p. 21): κ′_n = χ_n⁻¹(κ_n) ⊗ σ, with
  κ′_1 = κ_1.
- **Theorem A.** `HE.6/clean-rank-one-descent-theorem-A` applies `ES.5/howard-dvr-theorem` with R = ℤ_p, T = T_pE and
  𝓛 = 𝓛_1. Howard §1.7 takes 𝓛 = 𝓛_1(T), and 𝓛_s ⊆ 𝓛_1 for s ≥ 1, so the theorem's hypothesis 𝓛_s(T) ⊆ 𝓛 holds. The
  passage from H¹_F(K, A) to Sel_p∞(E/K) is Rubin's Proposition 1.6.8, as Howard says before Theorem 1.6.5, and the
  node's third step keeps it.
- **Primitivity.** `HE.6/primitivity-versus-nonzero` previously claimed an equality with no source; it now has one.
  Zanarella's Theorem 2.3.6 (p. 20) assumes:
  - that (T, F) and (T*, F*) satisfy H.0–H.5;
  - p > 4;
  - 𝓛 ⊇ 𝓛_s(T) for some s ≥ 1;
  - κ_1 ≠ 0.

  It proves length M = length(H¹_F(K,T)/R·κ_1) − d(κ). Proposition 2.3.3 shows that d(κ) = 0 exactly when κ is
  primitive, in the sense of Definition 2.3.2: ∂^(∞)(κ) = 0, that is, κ^(1) ≠ 0. For T_pE the dual hypotheses are
  automatic, since T* ≅ T by the Weil pairing. The node's restriction to p ≥ 5 is Zanarella's p > 4. Howard proves only
  the inequality, and the node now says so.
- **The edge HE.6 → HE.8.** The finding asked for it; the fix argues that it is not needed. Howard's Proposition 2.1.3
  (p. 23) proves Theorem B's specialisations by "By Theorem 1.6.1, we need only verify that Hypothesis H.0–H.5 hold".
  It reuses Theorem 1.6.1, which is ES.5, and an argument parallel to Theorem 1.6.5's, which is HE.5's. HE.5 → HE.8 is
  an atlas edge, and no declaration of HE.8, HE.8b or HE.8c has a prerequisite in HE.6. The fix also warns that
  adding the edge would close a cycle through ModularIwasawaMainConjectures L1 unless HE.6z exists; I confirmed the
  path HE.8 → … → L1 in the atlas. The argument is right.

The edges ES.5 → GH.5 and ES.8 → GH.5 are for the maintainer, as the structure proposal says. A packet cannot add
them.

**Correction 1.** The new request to ES.5 for the primitivity equality defined primitivity as a nonzero image in
KS(T/mT) "as in ES.5/divisibility-invariants". That node is Mazur–Rubin's Definitions 4.5.5, 4.5.7 and 5.2.11, for
their Kolyvagin systems over ℚ. Howard's systems live over K, twisted by G_n, and Zanarella defines primitivity for
them separately (Definition 2.3.2). The request also left the coefficient ring implicit and listed the dual
hypothesis loosely. It now asks for the equality over a discrete valuation ring R of residue characteristic p ≥ 5,
for a Selmer triple (T, F, 𝓛) over K such that (T, F) and its dual satisfy H.0–H.5, with 𝓛 ⊇ 𝓛_s(T). It places M in
the decomposition of `ES.5/howard-dvr-theorem`. It defines primitive as a nonzero image in KS(T/mT, F, 𝓛 ∩ 𝓛_1(T)). It
says that the request includes the definition for Howard's systems, as Zanarella gives it. The node's own text, "as in
ES.5/divisibility-invariants", is a fair pointer once the request says this, so I left the node unchanged.

## /2 (high, missing): level raising has no owner. Correctly fixed.

- **The level-raising step.** `HE.6/zhang-cohomological-congruence` now states it as an import in Zhang's form. The
  request to R20.2 states Theorem 2.1 (p. 203) as printed:
  - g a weight-two newform of level N with trivial nebentypus;
  - 𝔭 with ρ̄_{g,𝔭} irreducible and p ≥ 5;
  - q admissible, which by Notations (xiv) means q ∤ NDp, q inert in K, p ∤ q² − 1 and a_q ≡ ±(q + 1) mod 𝔭.

  It concludes with g′ of level Nq and trivial nebentypus, with the same residual representation over k₀. The
  request leaves the conditions that involve K, such as q inert, in HE.6. It cites Zhang's references [11] (Duke Math.
  J. 74, Theorem 1) and [10] (Invent. Math. 115, Theorem B). Zhang's proof (pp. 203–204) prescribes the inertial types
  and reads off the exact level and the trivial nebentypus, as the request says.
- **The withdrawn R17.3 request.** The fix withdrew the request to R17.3 for integral multiplicity one and Ihara's
  lemma, and that is right. `R17.3/global-jl` and `/multiplicity-one` give the transfer and multiplicity one in the
  automorphic spectrum and nothing integral. `/definite-infinity` leaves the algebraic form space and its
  identification to R18.3, whose stage text, "Define algebraic automorphic forms on the finite double-coset set … the
  comparison to the corresponding GL₂ representations", covers the new request.
- **The integral inputs.** They are requested as Zhang states them:
  - Lemma 3.3 (p. 215): J(X_m)[𝔪] ≃ V, from Mazur, Ribet and Wiles for modular curves and Helm's Corollary 8.11 for
    Shimura curves;
  - (4.8) (p. 219): multiplicity one, "by the proof of [33, Thm. 6.2] via 'Mazur's principle'", where [33] is
    Pollack–Weston;
  - (4.9): from Bertolini–Darmon, Theorem 9.2, "essentially as a consequence of Ihara's lemma in [10] for Shimura
    curves over Q".

  The request says that Zhang states (4.9) for Heegner points.
- **The node's other steps.** Step 2 correctly says that g_m is an unramified twist of Steinberg at each prime of
  N⁻m, since ℓ ‖ N with trivial character at ℓ | N⁻, and level raising gives the same at q. `zhang-jochnowitz-special-value`
  uses the eigenfunction as the proof of Theorem 6.5 does (p. 231, by (4.8) and (4.9)).
- **The neighbouring declarations.** The gap's description of R20.2, R22.1 and R21.2 matches their statements.
- **The proposed stage.** The structure proposal gives it a title and a statement. It requires R17.6 and R18.6, which
  come from the first round's specification. R18.6 is the geometric export layer and R17.6 a prerequisite of
  `R20.2/level-raising-diamond`. This is for the maintainer to decide, and I did not change it.

Zhang's §2 is in the packet's source record, which covers pp. 191–249.

## /8 (medium, error): HE.6's prerequisites and Zhang's Theorem 7.1. Correctly fixed.

- **The transfer.** The Zhang nodes cite R17.3, not R17.5. Removing the atlas edge R17.5 → HE.6 and the RS-21 link is
  the maintainer's.
- **The rank-zero input.** `HE.6/zhang-rank-zero-over-K` now runs through Skinner's theorems. I read them in full:
  - Theorem A (p. 1) covers a newform with p ≥ 3, ordinary, ρ̄ irreducible and a prime q ≠ p with q ‖ N at which ρ̄
    is ramified. For p ∤ N it is Theorem 2.5.2 (p. 15), the Skinner–Urban theorem. Footnote 1 and §2.5 replace
    hypothesis (*), an image containing SL₂(ℤ_p), by (a) ρ̄ irreducible and (b) an element g of Gal(Q̄/ℚ(μ_p∞)) with
    T_f/(ρ_f(g) − 1)T_f free of rank one.
  - §2.5 derives (b) from a generator of tame inertia at q (pp. 15–16).
  - Theorem B (p. 2) gives #O/(L^alg(f,1)) = #Sel_L(f)·∏ c_ℓ(T_f) for f ∈ S₂(Γ₀(N)) under the same conditions. Its
    condition (iii) only applies when p | N.
  - §3.2 (pp. 20–21) deduces Theorem B from Theorem A by Greenberg's method.
  - The introduction (p. 1) says that the note supplies the special-value formula needed by Zhang's paper, its
    reference [22].

  The three rewritten requests (L1, Kato L4, SelmerIwasawaCohomology L4) state these results accurately.
- **The form of the main conjecture.** L1's current text asks for dim V̄^(G_ℚℓ) = 0 as well as dim V̄^(I_ℓ) = 1. That
  is stronger than Zhang's third hypothesis, as the request says.
- **The twist g_K.** It is a newform of level N·D_K² with trivial character. It is still ramified at ℓ ‖ N, since
  (D_K, N) = 1, and it is ordinary at p exactly when p ∤ D_K. That is why E10's hypothesis is needed.
- **Kato's theorem.** `KatoEulerSystems:L4/ordinary-selmer-divisibility` is Theorem 17.4. Its integral part assumes
  (12.5.2), and the node says so.
- **Remark 15.** The node's new acceptance line, that Zhang uses only the inequality v_𝔭(L(g/K,1)/Ω) ≤ length Sel +
  Σ t_g(ℓ), is Zhang's Remark 15 (p. 232).
- **The consumer.** The only consumer of the rank-zero node is `zhang-indivisibility`, which assumes p ∤ D_K N and
  ordinarity.
- **The period identity.** `HE.6/ribet-takahashi-tamagawa-comparison` now imports
  `BSD.3a/definite-congruence-period`, whose prerequisite closure is free of this roadmap. The request to the BSD owner
  is right on all three points:
  - Zhang defines t_g(ℓ) over K_ℓ, (6.7) on p. 228, and notes that for ℓ inert in K "Φ(A/K_ℓ) is a constant group
    scheme since k_ℓ is a genuine quadratic extension". At a non-split multiplicative prime Frobenius acts on Φ by −1,
    so the ℚ_ℓ-points are 2-torsion.
  - The proof of Theorem 6.4 (pp. 229–230) handles nonsquarefree N through "the second assertion of [35, Theorem 1]"
    and Khare [22].
  - The prerequisites must stay free of HE.6.
- **The split.** It proposes HE.6z with the stated partition. All its claims hold; see "Checks".

**E9 (error, the proof, new).** The printed step on p. 232 is "The image of ρ̄_{A_g,𝔭} ⊃ SL₂(F_p) implies that the
image of ρ_{A_g,𝔭} ⊃ SL₂(Z_p)". Theorem 7.1 is stated for p ≥ 3. I checked each part of the record:
- **p = 3.** The implication is false. Elkies's abstract gives curves "for which ρ3 is not surjective mod 9 but
  generically surjective mod 3", the simplest of conductor 1944 and 6075. The LMFDB lists 1944.f1 with a-invariants
  [0, 0, 0, −27, −42], 3-adic image 9.27.0.1 and mod-3 image label 3G, the full GL₂(F₃). Its determinant is
  surjective, so the image meets SL₂(ℤ₃) with index 27.
- **p = 5.** The binary icosahedral argument is right. The icosian algebra over ℚ(√5) splits at √5, and the group
  embeds in SL₂(ℤ₅[√5]). The reduction kernel is a normal 5-subgroup of a group whose only normal subgroups are 1,
  {±1} and the whole group, so it is trivial, and 120 = |SL₂(F₅)|. The record says that this concerns closed
  subgroups, not a Galois image.
- **Manoharmayum.** His Main Theorem assumes |k| ≥ 4 and k ≠ F₅ when n = 2, which gives the implication for p ≥ 7.
- **The repair.** Skinner's (a) and (b) need only Theorem 7.1's own first and third hypotheses.
- **Searches.** The record lists them.

**E10 (gap, a stated result, new).** Theorem 7.1 assumes only "p is a good ordinary prime", and the Notations give
(p, N) = 1 and (D, N) = 1. Theorem 1.1 (p. 195) and the later main theorems assume p ∤ D_K N. Without it g_K is not
ordinary and the cited theorems do not apply. The record is right.

**Correction 2.** The gap "Independent review: definite period supplier must precede HE.6" and the structure
proposal for BSD.3a described the conflict with the BSD packet only through BSD.5's index formula. The BSD packet's
`BSD.4/kato-heegner-comparison` also uses `HE.6/sha-square-index-bound`. With the atlas edge BSD.4 → BSD.5, the derived
link HE.6 → BSD.4 closes the same cycle with BSD.5 → HE.6. Both texts now say so. Either proposed sub-layer removes
this form too:
- With HE.6z, the cycle becomes HE.6 → BSD.4 → BSD.5 → HE.6z, and nothing in HE.6z feeds HE.6 proper.
- BSD.3a has no prerequisite in BSD.4 or BSD.5.

## /9 (medium, missing): Serre's open-image theorem has no owner. Correctly fixed.

Route 5 of `PAPER-CALEGARI-GERAGHTY-20.result.json` is "Faltings finiteness, semisimplicity and isogeny theorems, Part
II: ℓ-adic and residual images of abelian varieties (Serre's open-image theorems)", with id
OpenImageTheoremsForAbelianVarieties. Its design job is #3406 and the review of that design is #3530. I read the brief.

- **What the brief plans.** Its theorem 1 is surjectivity mod p for large p, with image GL₂(ℤ_p) on T_p(E), for E/K
  with End_K̄(E) = ℤ.
- **What it leaves out.** It says "Effective bounds, uniformity and small ℓ are out of scope". It plans Bogomolov's
  homothety theorem only on Serre's route for abelian surfaces.
- **HE.7.** It names HE.7 as a consumer that "can import the large-p theorems from here and keep the rest".

The rewritten requests, the gap, the CM gap, HE.7's coverage and the structure proposal say exactly this. They also
list what HE.7 needs beyond the brief: the open image at every p, homotheties with bounded index, Ribet's GL₂-type
theorem, and the exports of Nekovář 6.1–6.2. Withdrawing R28.7 is right. The prerequisite stays at R28.4, with a gap,
because the Part II is not yet a roadmap. `HE.7/non-cm-open-image-application` names the owner.

## Corrections made

| Where | Before | After |
|---|---|---|
| `requests[34]` (ES.5, needed by `HE.6/primitivity-versus-nonzero`) | The equality "for a Selmer triple satisfying H.0–H.5 …, with its dual, p≥5 …", primitive "as in ES.5/divisibility-invariants" | The equality over a DVR R of residue characteristic p ≥ 5, for (T, F, 𝓛) over K with (T, F) and its dual satisfying H.0–H.5, with M as in `ES.5/howard-dvr-theorem`; primitive means a nonzero image in KS(T/mT, F, 𝓛 ∩ 𝓛_1(T)); the request includes that definition for Howard's systems over K (Zanarella Definition 2.3.2) |
| `gaps[16]` | The conflict described through HE.6 → BSD.5 only | Adds HE.6 → BSD.4 from `BSD.4/kato-heegner-comparison`, which closes the same cycle through BSD.4 → BSD.5; either sub-layer removes both |
| `restructure[4]` (`detail`, `proposal`) | "BSD.5, as well as BSD.6, consumes HE.6"; promotion derives BSD.5 → HE.6 and HE.6 → BSD.5 | Names BSD.4 and the three BSD declarations that use HE.6, and adds HE.6 → BSD.4 to the description of what promotion skips |
| `review`, `reviewHistory` | The accepted review of REV-HeegnerPointEulerSystems--HE.0~2 | This review, with a `checked` entry for each of the ten declarations the fix changed; the earlier review object moved, unchanged, to `reviewHistory` |

The reader, which this job may not edit, keeps the earlier wording of `requests[34]`, `gaps[16]` and `restructure[4]`.
Its owner should copy the three passages from the packet. Nothing in the suggested file depends on them.

## For the maintainer

The fix report's list "For the maintainer" is accurate as far as I checked it:
- HE.6z;
- removing R17.5 → HE.6 and the RS-21 link;
- ES.5 → GH.5 and ES.8 → GH.5, and not HE.6 → HE.8;
- the level-raising stage;
- passing the open-image items to the Part II's design job;
- BSD.3a or HE.6z, now with the BSD.4 form of the conflict;
- the derived links.

## What I did not read

- Gross's article, Kato's Astérisque text, Serre's 1972 paper and Nekovář §6.
- Diamond–Taylor, Helm, Bertolini–Darmon, Pollack–Weston, Ribet–Takahashi and Khare. The packet cites them as Zhang
  does, and I checked those citations against Zhang's text.
- The lemmas of Zanarella §2.2.
- The published versions of Skinner and Howard.
- The 32 findings handed to other jobs.
