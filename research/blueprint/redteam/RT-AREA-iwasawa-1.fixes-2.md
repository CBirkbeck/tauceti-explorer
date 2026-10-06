# Fix report: RT-AREA-iwasawa-1, second round

Job FIX-RT-AREA-iwasawa-1~2, Refs #6216. Worker: Claude — claude-PWOydn. Date: 6 October 2026.
Base tree: origin/main at `1647c054`. The bot confirmed this session's claim before work began. This session wrote
none of the red team, its verification, the first fix round, the Heegner packet or its two reviews.

The red team has 36 confirmed findings of high or medium severity. Round 1
(`RT-AREA-iwasawa-1.fixes.md`, 29 September) could edit no blueprint and wrote every fix as an instruction. One
finished blueprint now exists for this part of the area, `HeegnerPointEulerSystems--HE.0` (stages HE.0–HE.7,
accepted on 6 October by REV-HeegnerPointEulerSystems--HE.0~2). Four findings concern its stages: /2, /8, /9 and
/10. This round applies them in that packet, its reader and its suggested file, and edits nothing else. The other
32 findings belong to blueprints this job may not edit; the table near the end says where each one went. The
packet's `review` object is untouched; REV-FIX-RT-AREA-iwasawa-1~2 checks this round.

## What was already there, and what changed since

The two blueprint rounds of the packet carried the four findings already, as far as they could on 5–6 October: the
generic theorems were not planned inside HE, each had a request to an owner stage, and six `restructure` entries
proposed the owners. Three things have changed since, and they are what this round acts on.

1. **Supplier declarations now exist.** `EulerSystemsAndKolyvaginSystems--ES.0` has Howard's hypothesis record and
   DVR theorem; `--ES.8` (accepted) has his Λ-adic theorem; `GL2AutomorphicRepresentationsAndTransfer--R17.3`
   (accepted) has the global Jacquet–Langlands correspondence; `KatoEulerSystems` has Kato's Theorem 17.4;
   `RankZeroOneBSD--BSD.0` has the definite congruence-period identity that the packet's review had asked the BSD
   owner to export early. PROTOCOL.md section 3 says to cite such a declaration by its id. The packet still named
   stages and asked for what is now written.
2. **The owner of Serre's open-image theorem is decided, and it is not R28.7.** Route 5 of the accepted paper
   extraction PAPER-CALEGARI-GERAGHTY-20 creates "Faltings finiteness, semisimplicity and isogeny theorems, Part II:
   ℓ-adic and residual images of abelian varieties (Serre's open-image theorems)". The queued design job
   DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII (#3406) carries it; the roadmap is not yet defined.
3. **The promoted packet changed the stage order.** It derives the link ModularIwasawaMainConjectures:L1 → HE.6
   from Zhang's Theorem 7.1. With the existing path
   HE.8 → GeneralizedHeegnerCycles:GH.8 → AutomorphicCongruences:L2 → ModularIwasawaMainConjectures:L1, the atlas
   now places all of HE.6 after HE.8. Round 1 foresaw this and proposed a substage HE.6z for Zhang's theorem; the
   packet had not proposed it.

## Summary by finding

| Finding | Done in the packet | Left for others |
| --- | --- | --- |
| /10 Howard's self-dual theory needs one owner | HE.5 and HE.6 cite `ES.5/howard-hypotheses` and `ES.5/howard-dvr-theorem` by id; the request for the "missing Howard package" is closed; the one thing ES.5 still lacks, the equality for a primitive system, is requested with its source. | Stage edges ES.5 → GH.5 and ES.8 → GH.5 (maintainer). The edge HE.6 → HE.8 turns out not to be needed; see /10 below. |
| /2 Level raising has no owner | Zhang's congruence states level raising and its quaternionic transports as imports, with one exact request to the level-optimisation owner; the transfer of automorphic representations is the cited declarations `R17.3/global-jl` and `R17.3/multiplicity-one`; the request to R17.3 for integral statements it does not own is withdrawn. | A level-raising stage in SerreWeightAndLevelOptimisation (maintainer; no job carries it). |
| /8 HE.6's prerequisites; Zhang's Theorem 7.1 | Theorem 7.1 is derived from Skinner's Theorems A and B, for g and its twist, with the hypothesis p ∤ D_K added; Kato's theorem is a cited declaration; the period identity is the BSD owner's declaration `BSD.3a/definite-congruence-period`; a `split` entry proposes the sub-layer HE.6z; two new source corrections (E9, E10). | Stage HE.6z; removal of R17.5 → HE.6 and of the RS-21 link that came with it; the Skinner–Urban target in ModularIwasawaMainConjectures L1 (its blueprint job, with /14). |
| /9 Serre's open-image theorem has no owner | HE.7's requests, gap and structure proposal name the decided owner and say what HE.7 needs that the Part II's brief leaves out. | The design job's brief (maintainer or the design job); R28.7 is withdrawn. |

## Packet changes

| | Before | After |
| --- | --- | --- |
| Declarations | 78 | 78 (10 changed; no id added, removed or renamed) |
| Open requests | 64 | 63 (2 closed, 10 rewritten, 1 added) |
| Gaps | 21 | 21 (5 rewritten) |
| Structure proposals | 6 | 7 (5 rewritten, 1 added) |
| Source corrections | 8 | 10 |
| Sources | 9 | 11 |
| Checker | 0 errors, 0 warnings | 0 errors, 0 warnings |

Every implementation status stays `unchecked`; the packet stays `complete` with all eight stages `planned`.
The ten changed declarations: in HE.5 `finite-singular-comparison-and-the-corrected-kolyvagin-system`,
`actual-tate-hypotheses-h0-h2`, `actual-local-hypotheses-h3-h5`; in HE.6 `clean-rank-one-descent-theorem-A`,
`primitivity-versus-nonzero`, `zhang-cohomological-congruence`, `zhang-rank-zero-over-K`,
`zhang-jochnowitz-special-value`, `ribet-takahashi-tamagawa-comparison`; in HE.7 `non-cm-open-image-application`.

## /10 Howard's self-dual Kolyvagin-system theory

**Finding.** The theory of Howard §§1.2–1.6 (Selmer triples over an imaginary quadratic field, Kolyvagin systems
twisted by G_n, hypotheses H.0–H.5, Theorem 1.6.1) and the Λ-adic Theorem 2.2.10 had no owner in
EulerSystemsAndKolyvaginSystems; HE should verify the hypotheses and apply the theorems; add the stage edges
ES.5 → GH.5, ES.8 → GH.5 and HE.6 → HE.8.

**State.** The owner now exists. I read these declarations in full against Howard's text (arXiv:1202.6340v1):
`ES.5/howard-hypotheses` (Definition 1.2.3 and H.0–H.5), `ES.5/cassels-structure`, `ES.5/howard-stub`,
`ES.5/howard-dvr-theorem` (Theorem 1.6.1, for a DVR R, a Selmer triple with H.0–H.5 and 𝓛_s(T) ⊂ 𝓛), and
`ES.8/self-dual-lambda-adic-kolyvagin-bound` (Theorem 2.2.10 with its inputs listed as hypotheses). They state what
HE.5 and HE.6 need. The ES.0 packet is `partial` and its review says `needs_changes`, so the ES.5 declarations are
plans awaiting acceptance; ES.8 is accepted.

**Changes.**
- `HE.6/clean-rank-one-descent-theorem-A` (Howard's Theorem A): the prerequisite `…:ES.5` (a stage) becomes
  `…:ES.5/howard-dvr-theorem`, and the proof step names the instance (R = Z_p, T = T_pE, the propagated Kummer
  structure, 𝓛 = 𝓛_1 as in Howard §1.7) and says that the hypotheses are the two HE.5 nodes, as in Howard's
  Theorem 1.6.5.
- `HE.5/actual-tate-hypotheses-h0-h2` and `HE.5/actual-local-hypotheses-h3-h5` verify H.0–H.2 and H.3–H.5 of the
  record `ES.5/howard-hypotheses`, now a prerequisite of both.
- `HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system` says what the corrected family is: a Kolyvagin
  system for (T, F, 𝓛) in the sense of that record (Howard Definition 1.2.3, Theorem 1.7.5).
- `HE.6/primitivity-versus-nonzero` said that primitivity "together with the imported ES5 core/self-duality/local
  hypotheses" gives equality in Howard's bound, with no source for the equality. Howard proves only the inequality,
  and ES.5's Mazur–Rubin rank-one and structure theorems assume core rank one over ℚ. The equality is Zanarella's
  Theorem 2.3.6 (arXiv:1908.09197v1): under H.0–H.5 for (T, F) and its dual, p > 4 and 𝓛 ⊇ 𝓛_s(T),
  length M = length(H¹_F(K,T)/Rκ_1) − d(κ), with d(κ) = 0 exactly for a primitive system. The node now cites it and
  carries its restriction p ≥ 5, and the request to ES.5 asks for exactly this theorem. I read that theorem, its
  definition of primitivity and its proof, and not the lemmas of §2.2 the proof rests on.
- The request "Missing generic Howard self-dual DVR package" is removed. The gap and coverage lines that called the
  ES.5 supplier missing are rewritten.

**The edge HE.6 → HE.8 is not needed.** The finding asked for it because the old decomposition kept the
verification of H.0–H.5 (Howard's Theorem 1.6.5) inside the HE.6 node, and Howard's Proposition 2.1.3 reuses that
verification at each height-one prime. In the packet the verification is the two HE.5 declarations, and HE.5 → HE.8
is already an edge of the atlas. A script over all packets confirms that none of the 60 declarations of HE.8, HE.8b
and HE.8c in `HeegnerPointEulerSystems--HE.7s` has a prerequisite, direct or indirect, in HE.6. The `restructure`
entry says so, and warns that the edge, if added because HE.8's text lists "HE.3–HE.7", closes a cycle through
ModularIwasawaMainConjectures:L1 unless HE.6z exists.

**Not possible in a packet.** The stage edges ES.5 → GH.5 and ES.8 → GH.5, absent from the assembled graph.

## /2 Level raising

**Finding.** Zhang's induction runs on his Theorem 2.1 (Ribet, Diamond–Taylor); no layer plans it; HE.6 said
"existing level-raising/transfer owners".

**State.** `SerreWeightAndLevelOptimisation` has one level-raising declaration, `R20.2/level-raising-diamond`,
Diamond's criterion: it gives a form that is new at q on Γ₁(N) ∩ Γ₀(q), and not a newform of exact level Nq with
trivial nebentypus and the original local types. No stage for the theorem has been added and no queued job carries
this finding. Two other packets have neighbouring declarations,
`GL2ModularityLifting:R22.1/prescribed-level-raising-step` (a quaternionic step over totally real fields, from
Khare–Wintenberger) and `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic` (Ihara's lemma
for definite quaternionic forms); neither gives Theorem 2.1 or Ihara's lemma for Shimura curves. The accepted R17.3
packet has the global Jacquet–Langlands correspondence for any quaternion algebra over a number field, with
multiplicity one, and no integral statement; its nodes assign the Shimura-set identification and integral
realisations to other layers. Neither library has a level-raising theorem: a search of both source trees for
Ribet, Diamond–Taylor and Ihara finds one unrelated Mathlib file, and the Tau Ceti declaration `levelRaise` is the
degeneracy operator, as the finding says.

**Changes.**
- `HE.6/zhang-cohomological-congruence`: the proof steps say what is imported and from whom. Step 1 is Theorem 2.1
  in the exact-level form, requested, with what Diamond's criterion does and does not give. Step 2 cites
  `R17.3/global-jl` and `R17.3/multiplicity-one` for the transfer of g_m, which is Steinberg up to an unramified
  twist at each prime of N⁻m, asks HilbertModularVarietiesAndShimuraCurves R18.3 for the realisation of the
  transferred form as a function on the Shimura set, and lists the integral inputs by their place in Zhang:
  Lemma 3.3 (J(X_m)[𝔪] ≃ V; Helm for Shimura curves), (4.8) (multiplicity one on the Shimura set, by Mazur's
  principle) and (4.9) (from Bertolini–Darmon's Theorem 9.2, which rests on Ihara's lemma for Shimura curves over
  ℚ). The node gains a source locator at Theorem 2.1.
- The request to `SerreWeightAndLevelOptimisation:R20.2` now states Theorem 2.1 with its hypotheses and its proof
  route (Diamond–Taylor, Duke Math. J. 74, Theorem 1; Invent. Math. 115, Theorem B), and those three integral
  inputs. This follows round 1, which placed the transports in the level-raising stage. Conditions that involve K
  stay in HE.6.
- The request to `…:R17.3` for "integral residual multiplicity one (Helm), Ihara and the matching
  eigenfunction/Kummer congruence" is withdrawn: the transfer is supplied, and the rest is not R17.3's. A new
  request to R18.3 covers the Shimura-set identification. `HE.6/zhang-jochnowitz-special-value` follows the same
  pattern.
- The `restructure` entry gives the proposed stage a title, a statement and its requirements, and names the two
  neighbouring declarations so that the stage imports them and does not repeat them.

The finding also asked that Zhang §2 be in the source list. The packet's source record for Zhang covers
pp. 191–249 in full, §2 included, and the reader says so. The citation "J. reine angew. Math. 449" of the finding
is not a reference of Zhang's, as round 1 noted; the packet uses Duke Math. J. 74.

**Not possible in a packet.** The stage itself. See "For the maintainer", item 4.

## /8 HE.6's prerequisites and Zhang's Theorem 7.1

**Finding.** (1) R17.5 is the wrong transfer supplier; R17.3 is the right one. (2) Theorem 7.1 (rank zero over K,
from Kato and Skinner–Urban) has no supplier; add edges from ModularIwasawaMainConjectures L1, KatoEulerSystems L4
and GrossZagierAndArithmeticHeights GZ.5. (3) Add a node for Theorem 7.1 with its hypotheses. (4) Add nodes for the
Jochnowitz congruence and for Theorem 6.4, importing the Ribet–Takahashi calculation or planning it.

**State.** Parts (1), (3) and (4) were in the accepted packet, and the links of (2) are live, derived from its
prerequisites. The following were still wrong or open.

**Changes.**
- *The reference for Theorem 7.1.* Zhang derives it from "the variant of [Skinner–Urban, Theorem 2] for GL₂-type
  abelian varieties", which "clearly" extends. The statement he needs is in print: Skinner's Theorem B
  (Pacific J. Math. 283 (2016); arXiv:1407.1093v1), the rank-zero formula #O/(L^alg(f,1)) = #Sel_L(f)·∏ c_ℓ(T_f)
  for a weight-two newform with coefficients O and p ≥ 3, under residual irreducibility and a prime q ∥ N at which
  ρ̄_f is ramified. Skinner's introduction says the note was written in part to supply this formula for Zhang's
  paper. Theorem B follows from his Theorem A, the main conjecture as an equality in Λ_O, by Greenberg's method
  (§3.2). `HE.6/zhang-rank-zero-over-K` now runs through these two theorems, applied to g and to its twist g_K, and
  three requests are rewritten to match: Theorem A to ModularIwasawaMainConjectures L1, the specialisation
  (Theorem B) to SelmerIwasawaCohomology L4, and Kato's integral bound under Skinner's two conditions to
  KatoEulerSystems L4.
- *The form of the main conjecture.* L1's text states only the Fouquet–Wan form, whose auxiliary prime must also
  have no invariants under the decomposition group; finding /14 and round 1 show that this is strictly stronger
  than what Zhang assumes. The request names Skinner's Theorem A with p ∤ N (his Theorem 2.5.2), for level N and
  for level N·D_K².
- *A step of Zhang's proof that fails (E9).* Theorem 7.1 is stated for p ≥ 3 with the hypothesis that the residual
  image contains SL₂(F_p). Its proof (p. 232) says that this implies that the 𝔭-adic image contains SL₂(ℤ_p), "a
  condition required to apply Kato's result". At p = 3 this is false: Elkies (arXiv:math/0612734) gives elliptic
  curves over ℚ whose 3-adic representation is surjective modulo 3 and not modulo 9, and the LMFDB lists 1944.f1
  with 3-adic image 9.27.0.1 of index 27. At p = 5 it does not follow from the residual image when the coefficient
  ring is ramified over ℤ₅: the binary icosahedral group sits in SL₂(ℤ₅[√5]) and maps isomorphically onto SL₂(F₅).
  The general lifting theorem (Manoharmayum, arXiv:1304.1196v2) excludes exactly the residue field F₅ for 2 × 2
  matrices. Zhang applies Theorem 7.1 to level-raised forms, whose coefficient rings he does not control, and his
  main theorem allows p = 5. The step is not needed: Skinner's §2.5 shows that the integrality requires only
  residual irreducibility and an element with free rank-one coinvariants, which the theorem's own third hypothesis
  provides. The node uses that, and the mistake is recorded as `HeegnerPointEulerSystems/E9` (kind `error`, affects
  `the proof`, `known: new`). The statements of Theorems 7.1 and 1.1 are not in question. The icosahedral example
  is one of closed subgroups, not of a Galois image, and the record says so.
- *A missing hypothesis (E10).* Theorem 7.1 does not assume p ∤ D_K, and the Notations assume only (p, N) = 1 and
  (D_K, N) = 1. The proof applies the rank-zero formula to the twist g_K, of level N·D_K², which is not ordinary at
  p when p | D_K. Zhang's main theorems assume p ∤ D_K N. The node now has p ∤ D_K; the omission is recorded as
  `HeegnerPointEulerSystems/E10` (kind `gap`, affects `a stated result`, `known: new`).
- *Kato.* `KatoEulerSystems:L4/ordinary-selmer-divisibility` is Kato's Theorem 17.4 for a newform and is now a
  prerequisite. Its integral part assumes an image containing SL₂(ℤ_p); the request to KatoEulerSystems L4 is
  reduced to the integral bound under Skinner's conditions. The node says what Kato's bound does here: it is the
  upper bound inside Theorem A, and alone it gives the direction from L(g/K,1) ≠ 0 to finiteness.
- *The period identity.* The packet's review had found that BSD.5 consumes HE.6 and had asked the BSD owner for an
  early export. That export exists now: `RankZeroOneBSD:BSD.3a/definite-congruence-period`.
  `HE.6/ribet-takahashi-tamagawa-comparison` cites it and says that the identity is imported; what stays in HE.6
  is its use and the additive-prime argument. A script confirms that the export has no prerequisite, direct or
  indirect, in HeegnerPointEulerSystems. The request to the BSD owner now asks three things of that declaration.
  It writes t_g(ℓ) = length Φ(A_g/ℚ_ℓ)_𝔭 and calls it the Tamagawa factor, while Zhang (6.7) takes the component
  group over K_ℓ, which for ℓ | N⁻ is the geometric component group (Zhang, p. 228: "Φ(A/K_ℓ) is a constant group
  scheme since k_ℓ is a genuine quadratic extension of F_ℓ"). Its statement covers nonsquarefree N while its proof
  route is Pollack–Weston's squarefree one. Its prerequisites must stay free of HE.6.
- *HE.6z.* A `restructure` entry of action `split` proposes two sub-layers. HE.6 proper keeps the six declarations
  of Howard's Theorem A, Gross's clean descent, the Sha bound and the primitivity comparison. HE.6z, "Zhang's
  indivisibility of Heegner points", takes the thirteen declarations of the Zhang branch. Checked by script on the
  packets and the assembled atlas:
  - no declaration outside HE.6z, in this packet or any other, has a prerequisite in HE.6z;
  - every HE.6z declaration lies under `zhang-indivisibility`;
  - HE.6z needs HE.2, HE.3 and HE.4 inside the roadmap, and no declaration of HE.6 proper;
  - of all supplier layers of HE.6z only ModularIwasawaMainConjectures:L1 is reachable from HE.8;
  - no supplier layer of HE.6 proper is reachable from HE.8.

  The reason for the split is the stage order, and the conflict with BSD.5 described under "For the maintainer",
  item 6. It is round 1's HE.6z with two corrections: HE.6z does not require HE.6, and it takes the period
  identity from BSD.3a.

**Not possible in a packet.** A packet cannot create a stage, and promotion derives links layer to layer. The
link ModularIwasawaMainConjectures:L1 → HE.6 therefore stays until HE.6z is a stage. Removing R17.5 → HE.6 is
also the maintainer's: it is an edge of the base atlas. Accepted RS-21 added a link from the Tau Ceti
InductionRestriction layer 7 to HE.6 as "a component formerly reached through R17.5"; no HE.6 declaration uses
it, and round 1 had asked that it be dropped.

## /9 Serre's open-image theorem

**Finding.** HE.7's finiteness for all primes needs Serre's theorem that ρ̄_{E,p} is surjective for almost all p;
no layer owns it; round 1 proposed a stage R28.7.

**State.** HE.7 already imports the theorem and plans only its application
(`HE.7/non-cm-open-image-application`). For the exceptional primes the packet follows Nekovář's integral argument,
which needs homotheties and an irreducibility statement, requested separately. The requests went to
`FaltingsFinitenessAndIsogenyTheorems:R28.4` "pending R28.7". The Part II's brief lists HE.7 among its consumers and
expects HE.7 to "import the large-p theorems from here and keep the rest (an overlap for HE.7 to narrow)". The
packet has narrowed it: HE.7 plans none of the general theorems.

**Changes.** I compared what the brief plans with what HE.7 uses.
- Planned by the brief: for a number field K and E/K with End = ℤ, ρ̄_{E,p} surjective for large p, and image
  GL₂(ℤ_p) on T_pE for those p. This is what `non-cm-open-image-application` needs for Gross's clean theorem.
- Not planned by the brief, which puts "effective bounds, uniformity and small ℓ" out of scope: the open p-adic
  image at every p and the finite adelic index; homotheties for the GL₂-type quotients with index bounded across
  coefficient primes (the brief plans Bogomolov's theorem only on one route for abelian surfaces); Ribet's theorem
  for the GL₂-type quotients of the Kolyvagin–Logachev branch; the irreducibility and endomorphism exports of
  Nekovář 6.1–6.2.
- The open p-adic image at every p is stated once in the atlas, as a cited leaf of an accepted packet:
  `AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image`, with its proof recorded there as a gap. The packet
  does not cite that node, which belongs to a consumer; the `restructure` entry asks that the Part II own the
  theorem and that node import it.

The two requests, the gap "Missing general Serre/Ribet open-image layer", the gap on CM conductor and image
contracts, HE.7's coverage line and the `restructure` entry now say this, and withdraw R28.7. The stage
prerequisite stays `…:R28.4` with a gap, because a packet can name only stages that exist. The proof step of
`non-cm-open-image-application` names the owner.

I did not read Serre's paper or Nekovář §6 for this round. The list of what HE.7 uses is taken from the packet's
reviewed declarations and requests, and the list of what the brief plans from the brief.

## Reader and suggested file

The reader was regenerated from the packet for every declaration, request, gap, structure proposal, source and
coverage line, by a script that first reproduced the existing text. Twenty declaration sections changed: the ten
above, and ten whose source locators, and in one case the statement, the accepted review had corrected in the
packet but could not write into the reader. Among them are the two clarifications that review left for the
reader's owner (the splitting prime λ = qO_K in the quaternionic reduction, and Pollack–Weston §§6.2–6.5 with
Theorem 6.8). Hand-written passages were updated: the counts, the opening of HE.6 and HE.7, the note before the
requests, the source corrections (it listed five; ten are recorded) and the last section, which still described
the packet as awaiting review.

In the suggested file seven statement comments changed, to match the packet, and the header gained two lines. No
name or signature changed. `lean-check` elaborates it at the pinned Mathlib with exit code 0, no errors and
114 warnings, each "declaration uses `sorry`", as before this round. The file imports Mathlib only; no Tau Ceti
module is compiled.

## For the maintainer

A packet adds links and never removes one, and it cannot create a stage. These actions complete the four findings.

1. **Create HE.6z** as proposed in the packet's `restructure` (action `split`), with the thirteen declarations
   listed there, and re-parent them. Its text can be round 1's HE.6z paragraph (section /8 of
   `RT-AREA-iwasawa-1.fixes.md`) with these changes: the rank-zero input is Skinner's Theorems A and B with
   p ∤ N·D_K; the period identity comes from RankZeroOneBSD BSD.3a; HE.6z does not require HE.6.
2. **Remove R17.5 → HE.6** from the base atlas, and the RS-21 link from InductionRestriction layer 7 to HE.6.
3. **Add ES.5 → GeneralizedHeegnerCycles:GH.5 and ES.8 → GeneralizedHeegnerCycles:GH.5.** Do not add HE.6 → HE.8
   unless HE.6z exists; with the present declarations it is not needed.
4. **Level raising.** Add the stage round 1 specified for SerreWeightAndLevelOptimisation (section /2 there), with
   Mazur's principle on the Shimura set and Bertolini–Darmon's Theorem 9.2 named among the transports, and link it
   to HE.6z. No queued job carries finding /2 outside this packet.
5. **Open image.** Do not add R28.7. Pass to DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII the items its brief
   leaves out (listed under /9), and link the Part II to HE.7 when it exists. Round 1 proposed to mark three items
   of PAPER-KOLYVAGIN-90 with "owner proposed: R28.7"; the owner to name is the Part II.
6. **BSD.3a.** The period export is planned under BSD.5, and BSD.5's index formula consumes HE.6. Once both
   packets are live, promotion derives BSD.5 → HE.6 from this packet and HE.6 → BSD.5 from the BSD packet and
   skips the second. Either sub-layer removes the conflict: BSD.3a, which `RankZeroOneBSD--BSD.0` proposes, or
   HE.6z.
7. **Derived links.** With the suppliers promoted today, two derived links are no longer produced and one is new.
   ES.5 → HE.5 returns when the ES.0 packet is accepted (HE.5 now cites its declaration, not the stage);
   ES.5 → HE.6 is an edge of the base atlas and stays. R11.6 → HE.6 belonged to the period export's route and now
   belongs to the BSD packet. R18.3 → HE.6 is new. A dry run of the atlas build with the new packet shows no other
   change and no skipped link.

Round 1's edits to `content/campaign/HeegnerPointEulerSystems/README.md` for HE.6 and HE.7 (sections /2, /8, /9,
/10 there) are not repeated here. This job may not edit that file, and for the layers a packet covers the atlas
shows the packet and its reader.

## Findings handed to other jobs

The issue assigns each remaining finding to the blueprint jobs of its roadmaps. The second column says what exists
today; "names the finding" means that the packet's text refers to it by its id, which is all that was checked. I
did not review those packets. Finding /10 is listed for its generic part.

| Finding | Handed to, and the state of that blueprint on 6 October |
| --- | --- |
| /1 | BP-HeegnerPointEulerSystems--HE.7s: packet `complete`, review `needs_changes`; names the finding |
| /3 | BP-GrossZagierAndArithmeticHeights--GZ.0: packet `partial`, not reviewed; does not name it; BP-HeightsRationalPointsAndObstructions: packet `partial`, not reviewed; does not name it |
| /4 | BP-ModularIwasawaMainConjectures: no packet yet; BP-RankZeroOneBSD--BSD.0: packet `partial`, review `needs_changes`; names the finding |
| /5 | BP-HeegnerPointEulerSystems--HE.7s: packet `complete`, review `needs_changes`; names the finding; BP-ModularIwasawaMainConjectures: no packet yet; BP-RankZeroOneBSD--BSD.7: packet `complete`, accepted; names the finding |
| /6 | BP-AutomorphicCongruences--L0: no packet yet |
| /7 | BP-AutomorphicCongruences--L0: no packet yet; BP-AutomorphicPadicLFunctions: packet `partial`, review pending; does not name it |
| /10 | BP-EulerSystemsAndKolyvaginSystems--ES.0: packet `partial`, review `needs_changes`; names the finding; BP-GeneralizedHeegnerCycles--GH.0: packet `partial`, not reviewed; does not name it |
| /11 | BP-AutomorphicPadicLFunctions: packet `partial`, review pending; does not name it; BP-GeneralizedHeegnerCycles--GH.0: packet `partial`, not reviewed; does not name it; BP-GrossZagierAndArithmeticHeights--GZ.8: packet `partial`, review `needs_changes`; names the finding |
| /12 | BP-GrossZagierAndArithmeticHeights--GZ.0: packet `partial`, not reviewed; does not name it |
| /13 | BP-HeegnerPointEulerSystems--HE.7s: packet `complete`, review `needs_changes`; names the finding |
| /14 | BP-ModularIwasawaMainConjectures: no packet yet; BP-RankZeroOneBSD--BSD.0: packet `partial`, review `needs_changes`; names the finding |
| /15 | BP-RankZeroOneBSD--BSD.0: packet `partial`, review `needs_changes`; names the finding |
| /16 | BP-RankZeroOneBSD--BSD.0: packet `partial`, review `needs_changes`; names the finding |
| /17 | BP-GrossZagierAndArithmeticHeights--GZ.0: packet `partial`, not reviewed; does not name it; BP-ModularIwasawaMainConjectures: no packet yet; BP-RankZeroOneBSD--BSD.0: packet `partial`, review `needs_changes`; names the finding |
| /18 | BP-SelmerIwasawaCohomology: packet `partial`, not reviewed; does not name it |
| /19 | BP-PadicHodgeRegulators--D.1: packet `partial`, review `needs_changes`; names the finding; BP-SelmerIwasawaCohomology: packet `partial`, not reviewed; does not name it |
| /20 | BP-SelmerIwasawaCohomology: packet `partial`, not reviewed; does not name it |
| /21 | BP-EulerSystemsCyclotomicMainConjecture: packet `partial`, not reviewed; does not name it; BP-SelmerIwasawaCohomology: packet `partial`, not reviewed; does not name it |
| /22 | BP-AutomorphicCongruences--L0: no packet yet; BP-ModularIwasawaMainConjectures: no packet yet |
| /23 | BP-ModularIwasawaMainConjectures: no packet yet |
| /24 | BP-AutomorphicCongruences--L0: no packet yet |
| /25 | BP-AutomorphicCongruences--L0: no packet yet |
| /26 | BP-AutomorphicCongruences--L0: no packet yet |
| /27 | BP-AutomorphicCongruences--L0: no packet yet; BP-GeneralizedHeegnerCycles--GH.0: packet `partial`, not reviewed; does not name it |
| /28 | BP-AutomorphicCongruences--L0: no packet yet |
| /29 | BP-AutomorphicCongruences--L0: no packet yet |
| /30 | BP-AutomorphicCongruences--L0: no packet yet; BP-RankZeroOneBSD--BSD.0: packet `partial`, review `needs_changes`; names the finding |
| /31 | BP-AutomorphicCongruences--L5b: no packet yet |
| /32 | BP-AutomorphicPadicLFunctions: packet `partial`, review pending; does not name it |
| /33 | BP-AutomorphicPadicLFunctions: packet `partial`, review pending; does not name it |
| /34 | BP-AutomorphicPadicLFunctions: packet `partial`, review pending; does not name it |
| /35 | BP-EulerSystemsAndKolyvaginSystems--ES.8: packet `complete`, accepted; names the finding |
| /36 | BP-EulerSystemsAndKolyvaginSystems--ES.0: packet `partial`, review `needs_changes`; names the finding; BP-EulerSystemsCyclotomicMainConjecture: packet `partial`, not reviewed; does not name it; BP-KatoEulerSystems: packet `complete`, review `needs_changes`; names the finding |

Findings /2, /8 and /9 are handed to no other job. What they need outside this packet is in "For the maintainer".

## A second reading before submitting

A separate reader, given the diff, the findings, the sources and the supplier packets but not my conclusions,
checked the edits. Its checks of the quotations, of Zhang's, Howard's and Skinner's statements, of the cited
supplier declarations and of the graph claims passed. It found ten problems, all corrected before submission:

- E9 said the printed implication holds for p ≥ 5; it does not when the coefficient ring is ramified at 5. The
  record now gives the example and the scope.
- The rank-zero node used p ∤ D_K without assuming it. Added, with E10.
- The primitivity node asked ES.5 for an equality without a source. Zanarella's theorem is now cited.
- I had written that no packet states Serre's open-image theorem. One states the open p-adic image as a cited
  leaf; the packet and this report now say so.
- A sentence claiming that no level raising is planned anywhere was false as worded; two neighbouring declarations
  are now named.
- I had kept round 1's claim that HE.6 → HE.8 is a true dependency. At declaration level it is not; the proposal
  and this report are corrected.
- The reader said that Gross's descent applies the self-dual theorem. It does not; corrected.
- The request to the BSD owner had dropped the nonsquarefree case, and one sentence about component groups held
  only for elliptic curves. Both corrected.
- Skinner's Theorem B, on a page I had recorded as read, is the reference Zhang's proof needs. The node, three
  requests and E9 now use it.
- The Jacquet–Langlands declaration was cited for more than it gives. Multiplicity one is now cited too, and the
  Shimura-set identification is requested from its owner.

It also noted process remarks inside node fields, which I moved to gaps and to this report.

## Checks run

- `scripts/check_blueprint.py` on the packet, with the declaration index of the pinned baseline: 0 errors,
  0 warnings.
- `check_issues` and `versions_checked` of `scripts/check_errata.py` on the ten source corrections: no error.
- `research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- The node graph over every file in `research/blueprint/packets/`: no cycle through a declaration of this packet;
  the statements about HE.6z listed under /8; no HE.8 declaration rests on HE.6.
- The atlas build (`assemble`) with the new packet in a scratch copy of the promoted blueprints: it builds, with
  no skipped link; the changes in derived links are item 7 above.
- The reader contains, verbatim, every statement, proof step, prerequisite list, source line and acceptance line
  of the packet, and every request, gap and structure proposal. The suggested file contains every statement and
  every declaration, API and test name.
- `lean-check` on the suggested file, as reported above.

## What was read, and what was not

- Zhang (version of record, SHA-256 as in the packet): Notations, §2, Lemma 3.3, the proof of Theorem 4.3 around
  (4.7)–(4.9), §6.3, Theorems 6.4–6.5, §7 through the proof of Theorem 7.2; pp. 231–232 also as page images.
- Howard (arXiv v1): Theorem A, Definition 1.2.3, H.0–H.5, Theorems 1.6.1, 1.6.5, 1.7.5, the opening of §1.7; of
  Chapter 2 only the statement of Proposition 2.1.3 and the first lines of its proof.
- Skinner (arXiv:1407.1093v1): the introduction, §2.5 and the opening of §3.2. The published version was not
  obtained.
- Zanarella (arXiv:1908.09197v1): hypotheses (H.0)–(H.5) and §2.3 from Definition 2.3.2 to Theorem 2.3.6.
- Manoharmayum (arXiv:1304.1196v2): the Main Theorem and the remark that it fails for 2 × 2 matrices over F₅.
  Elkies (arXiv:math/0612734): the abstract. Both are evidence in E9 and are not sources of a declaration.
- Not read: Gross's article (a scan, read by the earlier rounds); Serre's 1972 paper; Nekovář §6; Kato's text;
  Diamond–Taylor, Helm, Bertolini–Darmon, Pollack–Weston, Ribet–Takahashi and Khare, which are cited here as Zhang
  cites them.
