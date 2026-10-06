# Review: GL₂ transfer, R17.3–R17.6 (REV-GL2AutomorphicRepresentationsAndTransfer--R17.3)

**Verdict: accepted after corrections.** Reviewer: Claude, session claude-QIk6wX; issue [#411](https://github.com/CBirkbeck/tauceti-explorer/issues/411); 6 October 2026. The plan under review was written by Codex, session codex-CcaPB4 ([#734](https://github.com/CBirkbeck/tauceti-explorer/issues/734), PR #6723). This review covers:

- the packet `research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R17.3.json`;
- the suggested file `research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer--R17.3.lean`;
- the reader document, read but not edited (section 8);
- the stage texts of R17.3–R17.6 and the roadmap's required checks;
- the accepted RS-21 boundaries;
- the four red-team findings the job was handed.

The plan's mathematics was largely sound and carefully hedged. Its evidence was not:

- 54 of its 55 source excerpts were placeholders;
- it planned one result that another roadmap owns;
- it missed one required check.

All three are fixed in place. The packet is a complete target-level pass, with all four stages `planned` and none closed. Its six gaps and 35 requests are exact.

## Method

- **Sources.** All 15 cited sources were downloaded, and every SHA-256 matches the packet. Rogawski–Tunnell 1983 is an image scan; it was read through the GDZ OCR of the article itself (LOG_0007, printed pp. 1–42), whereas the packet had linked the whole journal issue.
- **Added sources.** Five public sources were added and read:
  - Deligne–Serre 1974 (Numdam);
  - Tunnell, Bull. AMS 1981 (AMS; the planner could not obtain it);
  - Jacquet–Piatetski-Shapiro–Shalika, *Automorphic forms on GL(3) II* (Jacquet's page);
  - Tunnell, Invent. Math. 46 (1978) (GDZ);
  - Darmon–Diamond–Taylor, *Fermat's Last Theorem* (Darmon's page).
- **Node checks.** Six checker passes, split by stage group, read every node against its source at the locator, and every excerpt was matched mechanically against the extracted text. A seventh pass checked closure, suppliers, requests, gaps, links, the stage graph and the red-team findings. An eighth drafted the three added nodes. The reviewer read and merged every change, and checked these independently:
  - the eight baseline declarations at the pins;
  - every new source finding;
  - the Arthur–Clozel misprints on the page images;
  - the gap in Wiese's Lemma 2;
  - the explicit section GL₂(F₃) → GL₂(ℤ[√−2]), by enumeration: a group of order 48, mapping bijectively onto GL₂(F₃);
  - the suggested file.
- **Checks.**
  - `python3 scripts/check_blueprint.py` with the pinned declaration index: **0 errors, 0 warnings**.
  - Stage-graph cycle check over `data/atlas.json` edges and requires, `data/links`, the links of accepted restructuring proposals and this packet: **acyclic**, with and without the proposed R17.4a/AL.3b edges.
  - `lean-check` on the suggested file (Mathlib 082e2d3): **exit 0**, 119 placeholder-proof warnings and no other message.
  - Every packet declaration, API and test name occurs in the file.

## Counts

| | Before | After |
|---|---:|---:|
| Nodes | 55 | 57 (54 kept, 3 added, 1 removed) |
| definition / construction / theorem / comparison / application | 1 / 6 / 33 / 7 / 8 | 1 / 6 / 34 / 7 / 9 |
| Source citations on nodes | 55 | 193 |
| Excerpts of at most three words | 55 | 0 |
| Boilerplate `match` / `hypotheses` | 55 / 55 | 0 / 0 |
| API items / unit tests | 33 / 28 | 33 / 29 |
| Planets (R17.3 / R17.4 / R17.5 / R17.6) | 4 / 6 / 5 / 5 | 4 / 6 / 5 / 5 |
| Baseline declarations | 7 | 8 |
| Sources | 15 | 20 |
| Gaps / requests | 7 / 25 | 6 / 35 |
| Source issues | 1 (unreviewed) | 11 (all confirmed) |

Node verdicts in `review.checked`: 54 corrected, 3 added. Every kept node needed at least its evidence replaced.

## 1. Sources (systemic correction)

The packet's evidence was boilerplate:

- 54 of 55 excerpts were one- or two-word placeholders ("injective", "cuspidal", "lift", "ν"), and the 55th had three words.
- Every `match` was one of two boilerplate sentences.
- Every `hypotheses` field was the same sentence: "Use exactly the field, coefficient, local, cuspidality and infinity-type conditions stated in the statement …".

Every node now has:

- literal excerpts of at most 300 characters, each found in the source text at its locator;
- a `match` that says whether the passage is exact, a specialisation, a consumer use or a supporting passage only, and what differs;
- its actual hypotheses, one per item.

Locators now state which pagination they use:

- Langlands 1980 is the Digital Math Archive typescript (running-head page = PDF page − 3), not the Annals volume.
- JL70 is the IAS retypeset edition.
- Arthur–Clozel is cited by printed page (PDF page − 16).

Wrong locators were corrected, among them:

- Arthur–Clozel Theorem 3.1 is in Ch. 3 §3, not §1.
- Pan's Definition 5.4.11 is on p. 71.
- Carayol's §12.2.1 has only parts (a) and (b).
- Rogawski–Tunnell's strong Artin statement is §4, pp. 40–41, not the introduction.
- The GJ78 introduction is pp. 471–473.
- Wiese's Theorem 9 is on p. 130. Wiese's Lemma 11, which concerns levels, had been cited for restriction facts it does not contain.
- Langlands's dihedral statement is in his introduction, not §3.

Source records were corrected:

- `br10` is Badulescu–Renard (Compositio 2010), not Badulescu's 2008 Inventiones paper.
- `pan26` is "… modular curves II".
- `rt83` now links the article with its SHA-256.

## 2. Mathematical corrections

### R17.3

- **global-jl.** The domain "irreducible automorphic representations of D×(A_F) not factoring through Nrd" is false for split D, because Eisenstein constituents qualify. It is restated on the discrete spectrum L²(D×(F)A_F^×\D×(A_F), ω), ω unitary, minus the one-dimensional representations. The local condition is now square-integrability at every place of S, as in JL70 Theorem 16.1. JL70 itself calls Theorem 16.1 conjectural, so BR10 Theorem 18.1(a) is cited for the unconditional inverse. A test `jl_eisenstein_excluded_test` was added.
- **norm-exception.** JL70 shows only that the formal transfer of χ∘Nrd acts on no subspace of the automorphic forms. BR10's residual branch is now stated exactly (χ∘Nrd ↔ χ∘det).
- **multiplicity-one and strong-multiplicity-one.** Restricted to discrete series: the old hypotheses were false for split D. Both are in BR10 Theorem 1.4(b),(c) and Theorem 18.1(b).
- **local-factors.** The node now states equality for all twists, contragredients included, and the sign h_v = −1 at ramified places, whose product is 1. Prerequisites gained R17.1 and R16.5 (Godement–Jacquet) in place of AL.3 (Rankin–Selberg).
- **split-hecke.** b_v = q_v s_v is explicit, with CDN23's §4.1.4 polynomial.
- **coefficient-conjugation and rational-models.** The Pan and CDN20 passages are consumer uses only. The statements were tightened to the cohomological setting with L-models and no models from rationality fields alone, and they cite AF.4/rationality-field and AF.4/clozel-rationality.
- **definite-infinity.** "Pan's type W^{(−k,0)}" was a misquote. Pan's forms are A_{(k,0)}, valued in W^{(k,0)}, the dual of the representation of highest weight (0,−k). The k = 0 decomposition A^c ⊕ A^1 was checked.
- **invariant-exchange.** CDN23's setting is now exact: p > 2, p totally split, E of even degree. The N in "2Np" is a product of group orders, not a level. CDN23 compares the two algebras through Scholze's functor, so the node exports the JL pairing as an interface.
- **supercuspidal-globalization.** CDN20's footnote 21 allows twisting τ itself (changing ϖ) and a finite extension of the p-adic field L. The unsourced "prescribed tame data" was removed.

### R17.4

- **cyclic-base-change.** It asserted the all-place LLC restriction, which is the content of local-compatibility, a node that depends on it. It is now stated in local-lift form: Langlands §2 (A),(B), §8 and Arthur–Clozel Theorem 5.1. The θ⊞θ^σ output occurs only for ℓ = 2.
- **local-compatibility.** Arthur–Clozel Theorem 5.1 gives Shintani local lifts, not parameter restriction. The node now cites Langlands case by case: §2(e) for reducible, dihedral and archimedean parameters, Lemma 7.6 for special ones, Lemma 11.8 for tetrahedral ones. The octahedral dyadic case is assigned to R16.3 for every ℓ. Carayol's Proposition, which covers degree ≤ 3, is owned by AutomorphicGaloisRepresentations R19.2, downstream of this stage, and is not imported.
- **cuspidality.** Langlands Lemma 11.7 is only the self-twist criterion. The exact base-change criterion is Arthur–Clozel Ch. 3 Theorem 4.2(a),(b). "The nontrivial generator" was corrected.
- **cyclic-descent.** Proved by the twisted trace formula, not a "trace/converse" argument.
- **cyclic-descent-fibers.** The noncuspidal descent is unique among all automorphic π.
- **isobaric-fibers.** The exchanged case needs ℓ = 2, and R16.4 is now a prerequisite.
- **solvable-base-change.** Its proof cited tower-independence, a node that depends on it. The argument is now direct.
- **tower-independence and solvable-descent.** No source states either; the matches now say they are the packet's own arguments. The old locator concerned generator independence within one step. Solvable descent is now an explicit chain condition.
- **adjoint-lift.**
  - The local lift is now Gelbart–Jacquet's (Definition 3.1.3). The LLC/adjoint identification is an imported compatibility.
  - GJ78 Theorem 8.1, the Shimura integral, is an explicit input.
  - MP.5, ET.6 and AF.3 were added as prerequisites.
- **cubic-character-induction.**
  - Arthur–Clozel Theorem 6.2 matches only almost everywhere, and its cuspidality criterion is in Lemmas 6.3–6.4. JPSS 1979 II Theorem (14.2) was added for the all-place cuspidal case.
  - The unused GL₂ base-change prerequisite was removed.
- **gl3-recognition.** Restated as two theorems: the GL₃ converse theorem (Cogdell Theorem 3.3, n = 3) and the Jacquet–Shalika pole criterion. GL₃ isobaric strong multiplicity one is not used.
- **nonnormal-cubic-base-change.**
  - The input is cuspidal.
  - Tunnell's weak statement (almost everywhere) is distinguished from Carayol's all-place §12.2.1(b).
  - R16.5 and AL.3 were added.
  - The citation is [J.P.S.S.].

### R17.5

- **quadratic-induction and dihedral-artin.** JL70 §12 Proposition 12.1 is the all-place source. The dihedral locator (Langlands §3) was wrong.
- **tetrahedral-artin.** Langlands Theorem 3.3 holds over every number field. Its proof gives almost-everywhere equality and uses the Jacquet–Shalika pole criterion.
- **octahedral-artin.** Tunnell 1981 was obtained and read in full. Tunnell's argument uses only:
  - the weak JPSS transfer;
  - transitivity of base change;
  - quadratic descent fibres;
  - a Satake comparison using that S₄ has no element of order 6.

  The node had claimed a GL₃/GL₂×GL₃ analytic comparison for the descent choice; that claim was wrong. `gl3-recognition` was removed from its prerequisites, and cyclic-descent, cuspidality, R16.3 and R16.4 were added.
- **solvable-artin.** Rogawski–Tunnell state the strong Artin conjecture in §4 as a cuspidal π(σ) with equal L-functions. The all-place and ε clause rests on Langlands's sketched §3 equivalence and is now a recorded gap. The pinned `not_isSolvable_fin_two` is now a prerequisite; no node had cited it before.
- **finite-hecke-extension.**
  - The Grunwald–Wang case affects only uniqueness.
  - The proof follows Patrikis Lemma 2.3.6.
  - A Q, n = 2 example was added.
- **tate-vanishing.** The proof outline follows Patrikis Theorem 2.1.1. Local Brauer and reciprocity layers were added.
- **finite-projective-lift.** The finite image comes from the μ_M-valued cochain, not from compactness.
- **q-weight-one.** The classical source, Deligne–Serre Théorème 4.10 (Weil–Langlands), was added; Rohrlich–Tunnell is only a consumer.
- **tr-weight-one.** The archimedean component is exactly Rogawski–Tunnell's π₁.
- **odd-residual-lift.** BCGP's [Ser77, Theorem 4] is Tate's theorem H²(G_F, Q/Z) = 0, not a separate Serre lifting result. The step BCGP leave implicit is the reduction-compatible lift of the projective image; it is the recorded gap.
- **residual-lt-application.** Located in the proof of BCGP Proposition 10.1.3; Theorem 10.2.6 uses it only through 10.1.3(1).
- **Added nodes** (`addedBy` this review):
  - `tunnell-primitive-globalization`: Tunnell 1978, Theorem 1.3, read in the original.
  - `prescribed-local-induction`: Carayol 11.2, with the finite-order hypothesis Carayol leaves implicit.
  - `octahedral-mod-three-application`: the required "octahedral mod-3 application", following Darmon–Diamond–Taylor Theorem 3.14(a). It uses the explicit section GL₂(F₃) → GL₂(ℤ[√−2]), so it needs no general reduction-compatible lift.

### R17.6

- **teichmuller-conductor.** Case (ii) is D ≡ 5 mod 8; Rohrlich–Tunnell print "D ≡ ±5", which is redundant, not wrong. The 1-eigenspace comparison now covers subgroups. An unused prerequisite was removed.
- **rt-technical-lemma.** Copied exactly: χ² = 1, Prim_k(N), weight 2 or 4. "Essential" became "used in the proof; necessity not shown" (Rohrlich–Tunnell Remarks 2–3). New prerequisites supply the residual representations and the conductor bound (AGR R19.1, R19.4) and Atkin–Lehner theory (Tau Ceti ModularForms Layers 4 and 6), replacing R16.6 and R16.2.
- **serre-odd-trick.** The mixed-signature generator ≡ 1 mod 4 belongs to 𝔯^n, not to 𝔯.
- **rohrlich-tunnell.** Hypotheses are now Rohrlich–Tunnell's. The garbled acceptance item ("Odd D gives weight two, except …") was replaced. Case (iii) is open, not false.
- **solvable-dihedral and determinant-untwist.** The characteristic-two reasons were added:
  - PGL₂ = SL₂ over F̄₂;
  - A₄ is a Borel subgroup of SL₂(F₄);
  - S₄ does not embed;
  - ξ is unique and unramified at 2;
  - linear-dihedral image is equivalent to det = 1.
- **wiese-odd-lift.** Wiese's Lemmas 2–3 are now copied exactly: ℤ[ζ_m], any P | 2, conductor N or Nℓ. The proof uses a σ-stable modulus (source issue E6).
- **unramified-katz.** Wiese Theorem 9 gives level Γ₁(N(r̄)) and character det r̄, not "exact odd conductor". The pigeonhole step is added. The Q(√229) remark is marked as unproved in the source.
- **qualitative-residual-modularity and weight-two-witness.** The weight-one witness has uncontrolled level. The Hasse-invariant passages are Introduction p. 124 and Lemma 11's proof, and classicality needs N ≥ 5.
- **disjoint-irreducibility and quadratic-restriction.** The mathematics was checked. Quadratic-restriction is now characteristic-free through Mackey (InductionRestriction Layer 3); Layer 4 needs |G| invertible.
- **compatible-descent.** The descent is Arthur–Clozel Theorem 4.2(d), not 5.1. Semisimplicity and absolute irreducibility were added, and a match at one λ propagates to the whole compatible family.
- **potential-modularity-interface.** The claim that Galois descent gives no evidence of automorphic descent is corrected. Invariance at each cyclic step follows from strong multiplicity one; only the twist matching is conditional.

## 3. Structure, ownership and the red-team findings

- **Duplicate removed.** `R17.6/extraordinary-cubic-compatibility` restated Carayol's Proposition 12.2.2 and Lemma 12.1.3, which the AutomorphicGaloisRepresentations packet already plans as `R19.2/carayol-cubic-base-change-of-extraordinary` and `R19.2/carayol-primitive-restriction-lemma`.
  - The accepted fix of RT-AREA-langlands-2/4 (`RT-AREA-langlands-2.fixes.md`, /4) says "The extraordinary cuspidal case is proved in AutomorphicGaloisRepresentations R19.2 from R17.5". The accepted RS-21 decision does not keep it in R17.6 either.
  - The node, its Lean declaration and the link R17.6 → R19.2 were removed (PROTOCOL §15).
  - What R19.2 needs from this roadmap is now planned here: Tunnell's globalisation and prescribed-local induction (added R17.5 nodes), and the link R17.5 → R19.2 the fix requires.
- **RT-AREA-automorphic-1/1** was partly handled. The R17.4a proposal is now that of the accepted fix: requires R17.4, AL.3, AL.3b and MetaplecticAutomorphicForms:MP.5; consumed by R17.5.
  - AL.3b is the GL_n converse theorem for all n. R16.5 states its n = 2 instance separately; it is not a specialisation of an n = 3 statement, as the packet had said.
  - The adjoint lift's metaplectic input (MP.5) is a prerequisite and a request.
  - After the split, the non-normal cubic part of the R17.4 → R19.2 export becomes R17.4a → R19.2.
- **RT-AREA-automorphic-1/11** was right: the links R16.4 → R17.3, R16.5 → R17.5 and R16.6 → R17.5 are present, with node-level prerequisites.
- **RT-AREA-automorphic-1/12** was right: link R17.3 → R18.3, exported to R18.3–R18.4 with no reverse import.
- **RT-AREA-langlands-2/4** is corrected as described above. The packet keeps R17.4 → R19.2 and gains R17.5 → R19.2. The JPSS gap now also names the non-Galois cubic local compatibility (principal series, special, ordinary cuspidal) that the fix asks R17.4 to plan.
- **Stage graph.** It stays acyclic. The new edges R19.1 → R17.6 and R19.4 → R17.6 (rt-technical-lemma) are safe only because R17.6 no longer exports to R19.

## 4. Baseline

All seven original declarations were read at Mathlib 082e2d3 and Tau Ceti f790474 and confirmed: `Matrix.GeneralLinearGroup`, `.det`, `.map`, `Matrix.ProjGenLinGroup`, `.mk`, `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` and `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two`. The last was cited by no node; solvable-artin now uses it.

One declaration was added: `TauCeti.simple_indFDRep_ofLinearCharacter_iff`, the index-two irreducibility criterion for finite groups over an algebraically closed field of characteristic zero. It replaces the InductionRestriction Layer 4 stage citation in quadratic-induction, cubic-character-induction and the characteristic-zero case of quadratic-restriction, as PROTOCOL §3 asks.

## 5. Closure, requests and gaps

**Prerequisites.** Missing prerequisites were added where proof steps used them. Exact supplier nodes replace stage citations where they match:

- AutomorphicFormsOnReductiveGroups AF.2/AF.3/AF.4/AF.5;
- AutomorphicGaloisRepresentations R19.1 and R19.4;
- AlgebraicModularFormsAndSerreWeights R15.2 and R15.6;
- AutomorphicLFunctionsAndLocalFactors AL.1/hecke-l-functional-equation.

The R16.1, R16.4, R16.6, R15.2 and AS.6 requests were narrowed accordingly.

**Requests.** They were rebuilt from the prerequisites, so every cross-stage prerequisite has exactly one request listing exactly its consumers. New requests:

- MetaplecticAutomorphicForms MP.5;
- EndoscopicTransfer ET.6 (GL₃ local Langlands);
- Tau Ceti GlobalNumberFields Layers 1 and 10;
- Tau Ceti ClassFieldTheory Layers 5 and 6;
- Tau Ceti ModularForms Layers 4 and 6 (with Atkin–Li operators for nontrivial character);
- Tau Ceti Chebotarev Layer 10;
- Tau Ceti NumberFieldArithmetic Layer 5;
- Tau Ceti InductionRestriction Layer 3.

The InductionRestriction Layer 4 request was dropped.

**Gaps.** Six remain, each naming its exact input:

1. **The GL₃ converse theorem and Rankin–Selberg pole inputs (AL.3b).** Corrected as above; GL₃ isobaric strong multiplicity one is not needed.
2. **JPSS non-normal cubic transfer.** Now also the all-place statement and the non-Galois local compatibility that AGR consumes.
3. **Clozel 1986, limit multiplicities.** Named exactly.
4. **The reduction-compatible lift of a finite solvable projective image for p > 2.** Formerly "Serre 1977"; [Ser77, Theorem 4] is Tate's theorem.
5. **Local–global extension of finite-order characters (new).** Chevalley's congruence theorem; no stage owns it.
6. **The all-place upgrade of tetrahedral and octahedral Artin automorphy (new).**

Closed or dropped:

- the Tunnell 1981 gap, now read;
- the Tunnell 1978 gap, now read for the added node;
- "Missing compiled … supplier interfaces", which was a note about the Lean prototype, not a missing mathematical input.

## 6. API, unit tests, suggested file and planets

- **API and tests.** API items and unit tests were checked against the corrected statements. `globalJL_twist`, `globalJL_inverse`, `cyclicBaseChange_local` and `adjointLift_local` were made precise. One test was added. Every definition and construction keeps at least three tests. The tests were checked: e.g. diag(2,3) at residue degree 2 gives diag(4,9), trace 13 and determinant 36, and towers 2 then 3 give diag(64,729).
- **Suggested file.**
  - `unramifiedBaseChange` was defined by a placeholder; it is now the packet's definition, `A ^ f`. Its API, its tests and `compatible_base_change` are therefore true statements.
  - Eleven tests evaluated no packet declaration: the adjoint, cubic, inert, odd-degree and determinant computations. They now evaluate `adjointLift`, `cubicBaseChange`, `cyclicBaseChange` or `quadraticInduction` through the suppliers' Satake projections.
  - Several statements were false as written. `tower_independence (t₁ t₂) : t₁ = t₂` is now tied to the declarations. `quadratic_restriction` was a tautology and is now the Mackey criterion on Mathlib's `Representation.ind` and `Representation.IsIrreducible`, over any field. `teichmuller_conductor` asserted `D * conductorNorm = 2 ^ ν * N` for all naturals and is now the corrected dyadic case analysis.
  - `tate_vanishing` and `finite_projective_lift` now live on `Field.absoluteGaloisGroup F` with `[NumberField F]`, with locally constant cochains and open kernels. `disjoint_irreducibility` has its surjectivity hypothesis.
  - Prototypes were added for the three new nodes, together with a true statement `gl2F3_section`, using a real `redSqrtNegTwo : ℤ√(-2) →+* ZMod 3`.
- **Planets.** Unchanged; at most six per layer, names from the sources.

## 7. Source issues

- **E1** (Rohrlich–Tunnell p. 307, "ν = 3 in case (iii)" for case (iv)): **confirmed** on the page image. The sentence opens the second paragraph of §2.

New findings, all confirmed by the reviewer at the locator:

| Id | Source | Kind | Finding |
|---|---|---|---|
| E2 | JL70 p. 247 (IAS edition) | misprint | "M′ is split at an even number of places" should read "ramified". |
| E3 | Wiese 2004, p. 123 | error, known | "Dihedral ⇔ projective image D_n, n ≥ 3" fails for odd p (D₂). Corrected in Wiese's 2005 thesis. |
| E4 | Arthur–Clozel, p. xi | misprint | "Theorem 3.5.2" should be 3.5.1, the strong lifting theorem. |
| E5 | Langlands 1980 (typescript), p. 151 | misprint | "Lemmas 11.3 and 11.4": 11.4 is a Proposition. |
| E6 | Wiese 2004, proof of Lemma 2 | gap | The modulus 4Df does not force χ(σΛ) = 1 when f is not σ-stable. With 4D·f·σ(f) the lemma holds. |
| E7 | Wiese 2004, p. 124 | error, known | "Every Katz form of weight ≥ 2 on Γ₁ is classical" needs N ≥ 5. Corrected in the thesis. |
| E8 | Arthur–Clozel Thm 6.2, p. 215 | misprint | GL(n, A_F) for GL(nl, A_F). |
| E9 | Arthur–Clozel Lemma 6.3, p. 217 | gap, known | Composite degree; Lapid–Rogawski 1998, Henniart 2012. |
| E10 | Tunnell 1981, ref. [4] | misprint | CRAS pages 567–579 for 567–571. |
| E11 | Tunnell 1981, p. 175 | gap | At places inert in E, the common sign ω in diag(a_vω, b_vω) needs ω_π = det ρ, which follows from his Lemma. |

## 8. Reader document

`research/blueprint/readmes/GL2AutomorphicRepresentationsAndTransfer--R17.3.md` is not a deliverable of this review and was not edited. Its node sections reproduce the old packet word for word, so it repeats every defect corrected here:

- the placeholder excerpts and boilerplate sentences;
- the global-JL domain;
- "Pan's type W^{(−k,0)}";
- the octahedral "GL₃/GL₂×GL₃ analytic comparison";
- "D ≡ ±5 mod 8";
- the garbled Rohrlich–Tunnell acceptance item;
- Wiese's "exact odd conductor";
- the R17.6 extraordinary section, the R17.6 → R19.2 export and the old R17.4a text ("R16.5 imports/specializes");
- the gap list ("AMS endpoints refused access").

It also has reader-only overstatements:

- "Global transfer is an equivalence on the non-norm spectrum";
- "The octahedral comparison therefore retains Tunnell's analytic input";
- "omitting them would incorrectly include the discriminant-valuation-two case", whereas Rohrlich–Tunnell's Remark 3 says case (iii) is open.

It must be regenerated from this packet before promotion.

## 9. Questions for the orchestrator

1. **Reader document.** Regenerate it from the reviewed packet (section 8).
2. **Unpromoted suppliers.** The AutomorphicGaloisRepresentations packet is unreviewed, and the AutomorphicFormsOnReductiveGroups packet's review asked for changes. The node ids cited from them may move.
3. **AGR coordination.** When the AutomorphicGaloisRepresentations blueprint is next revised, its R19.2 nodes should cite `R17.5/tunnell-primitive-globalization`, `R17.5/prescribed-local-induction`, the Artin nodes and `R17.4/nonnormal-cubic-base-change` (R17.4a after the split) instead of whole stages. Its requests 22/23 should name these suppliers.
4. **Other consumers.** Several cite R17.x stages where exact nodes now exist:
   - GL2ModularityLifting's request to R17.4 for Gee Proposition 4.25 corresponds to `R17.6/compatible-descent` and `R17.6/potential-modularity-interface`.
   - SerreWeightAndLevelOptimisation's request to R17.6 for local–global compatibility at special primes belongs to R19.
   - PotentialModularity R23.1/R24.3 and ClassicalSerreModularity R26.1/R33.5 cite stages only.
5. **ET.4b.** The proposed ET.4b (RT-AREA-langlands-1/1, not yet live) would own GL_n cyclic base change and automorphic induction. cyclic-base-change and cubic-character-induction should import it once it exists.
6. **Ownerless input.** The new gap "Local–global extension of characters" has no owner in the atlas. A node after GlobalNumberFields Layer 9 is the natural home.
