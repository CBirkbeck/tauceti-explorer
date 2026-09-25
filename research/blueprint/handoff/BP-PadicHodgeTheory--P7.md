# BP-PadicHodgeTheory--P7 — handoff

Blueprint for **P-adic Hodge theory and geometric comparison** (`PadicHodgeTheory`), part P7, the first of
two parts. Stages in scope:

- P7:annulus-foundations, P7;
- P8:local-rational, P8;
- R06.1, R06.2, R06.3, R06.4.

The packet `part` is `"P7"`. R06.5 and R06.6 belong to part 2.

**Binding inputs.**
- The restructuring **RS-01** has been accepted (REV-RS-01). It keeps all stages of this roadmap and makes
  R06.1 the single owner of the rational period rings formerly in CP.0; this packet follows it.
- The reviewed decomposition `data/decompositions/PadicHodgeTheory.json` has 10 accepted nodes from
  Scholze's paper. All of their ids are kept and refined.
- The reviewed audit AUDIT-37 has been accepted. Mathlib already has C_p, the tilt, θ with surjectivity,
  `BDeRhamPlus` and `BDeRham`; they are baseline citations, not nodes.

**Deliverables.**
- Packet: `research/blueprint/packets/PadicHodgeTheory--P7.json`, with **242 nodes**:

  | stage | nodes |
  | --- | --- |
  | R06.1 | 44 |
  | P7:annulus-foundations | 27 |
  | P8:local-rational | 44 |
  | P8 | 22 |
  | R06.2 | 44 |
  | P7 | 32 |
  | R06.3 | 18 |
  | R06.4 | 11 |

  By kind: 31 definitions, 45 constructions, 73 lemmas, 87 theorems, 4 comparisons and 2 applications.
- Document: `research/blueprint/readmes/PadicHodgeTheory--P7.md`.
- Suggested Lean: `research/blueprint/suggested/PadicHodgeTheory--P7.lean` (4214 lines, namespace
  `TauCeti.PadicHodge`).

**Counts.**
- 579 API items and 324 unit tests.
- 42 planets.
- 73 baseline declarations.
- 16 gaps, 28 requests and 16 restructuring proposals.
- 39 source issues (`PadicHodgeTheory/E1`–`E39`) and 19 sources.

## Checks run

- `scripts/check_blueprint.py --index <baseline declarations index>`: **0 errors, 0 warnings**.
- `scripts/check_errata.py` on the source issues and versions: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- **Own checks.** The stage order used is R06.1 → P7:annulus-foundations → P8:local-rational → P8 → R06.2 →
  P7 → R06.3 → R06.4, following the atlas edges. Against it I confirmed:
  - no dangling prerequisite and no prerequisite on a later stage;
  - no dependency cycle, with the nodes in dependency order;
  - excerpts at most 300 characters;
  - every test has a kind;
  - planets only on definitions, constructions and theorems, and at most six per layer.
- **Lean: compiled.** I compiled with `lean` v4.34.0-rc2 against Mathlib 082e2d3. The exit code is 0, and
  the only messages are 508 `declaration uses 'sorry'` warnings.
  - The file imports one Tau Ceti module, `TauCeti.RingTheory.Huber.Restricted.TwoSidedSeries.Convolution`.
    Its source is present at f790474, and it was compiled against the TauCeti-adic build. No Mathlib or
    Tau Ceti build was run.
  - Every definition, API item and unit test of the packet appears in the Lean file under its packet name.
    The nodes without a declaration of their own are listed at the end of the file.
- **Stand-in declarations.** The Lean file gives signatures with `sorry` bodies for objects Mathlib lacks:
  - the Galois action on ℂ_p;
  - the ℚ_p-algebra structure, filtration and θ on `BDeRhamPlus`;
  - ε^♭ and p^♭.

  Mathlib's B_dR at the pinned commit has none of these.

## What the consumers get

- **ColemanIntegration** (L0 annulus nodes). The following nodes in P7:annulus-foundations serve it:
  - `annulus-laurent-ring`, `gauss-norm*` and `frechet-topology`;
  - `restriction-maps`, `robba-ring` and `annulus-derivation`;
  - `identity-principle` and `newton-polygon-breaks`.
- **PadicDifferentialEquationsAndRigidCohomology.**
  - Request 1 (the rings for every interval, R, R^bd, R^int, O_E and E, and coefficient extension) is served
    by P7:annulus-foundations.
  - Request 2 (Berger's B†_rig,K = R_{F'}(π_K)) is served in **P7** by `P7/robba-ring-of-p-adic-field` and
    `P7/berger-robba-identification`. It cannot sit in annulus-foundations: it needs the field of norms of
    PG.0, and PG.0 consumes annulus-foundations.
- **MordellLawrenceVenkatesh.**
  - `R06.2/ddr-exact-strict-tensor`;
  - `R06.2/ddr-of-tate-twists` and `R06.2/de-rham-implies-hodge-tate`;
  - `R06.1/tate-sen-theorem`;
  - `R06.2/induction-and-restriction-of-scalars` and `R06.2/hodge-number-tH`;
  - `R06.2/filtered-phi-n-modules` and `R06.2/period-functors`;
  - `R06.2/admissible-implies-weakly-admissible` and `R06.2/newton-number-tN`.
- **FaltingsFinitenessAndIsogenyTheorems.** `R06.2/hodge-tate-decomposition-tate`, which states the
  H⁰ and H¹ statements for C(ψ).
- **CohomologyComparisons.**
  - Served here: `R06.1/period-ring-invariants`, the period functors, and the rational period rings for
    CP.0–CP.3 under RS-01.
  - Redirected: its requests for Kisin's functor and Scholze's comparison go to R07.4 and to part 2 of this
    roadmap (restructure 10).

## Main findings

**Source issues.**
- **Scholze, Prop. 8.5 (E12).** The relative Poincaré lemma needs a completed tensor product. On T² → T¹,
  the section Σ[T₂♭]^k X₁^k lies in the kernel but not in the image of the uncompleted one. This affects the
  proof of Theorem 8.8, not the theorem.
- **Brinon–Conrad, Example 8.1.3 (E20).** The characteristic polynomial is X² + 4p, not the printed X² − 4p:
  the trace is 0 and the determinant is 4p. The conclusion about slopes is unchanged.
- **Berger 2002.**
  - The radius exponent e_K must be the ramification index of K_∞/F_∞ (E2).
  - Prop. 5.15's ∇_V(N_s) ⊂ tN_s needs s enlarged (E36).
  - Several items are known from Berger 2008 Appendix B and Berger's 2026 errata list:
    - the coefficient field F′ versus F (E1);
    - the normalisation N(log π) = −p/(p−1) (E3);
    - the extension of log to Ã† (E4);
    - the density form of ι_n(N_s) (E7).
- **Fontaine–Ouyang.** §1.3.3 lets the geometric Frobenius act on E(−1) by q⁻¹, the opposite of Deligne's
  relation (E37). Lemma 6.12 assumes an unproved separatedness (E29); the packet writes a repair, which a
  reviewer should check.
- **Tan–Tong.** The injectivity of B_cris⁺ → B_dR⁺ is omitted (E17), and there are three misprints.
- **Berger 2008.** It does not use "de Rham ⇒ potentially semistable" (Remarque V.2.2), but it does go
  through RD.2's monodromy theorem and R06.3/P7 constructions (E32).

**Ownership decisions** (recorded as restructuring proposals):
- **Berger's Robba dictionary.** Parts A and D both drafted it. It is planned once, in P7, and R06.3 cites
  it. This adds a stage link P7 → R06.3, which creates no cycle (restructure 15).
- **Sen's module and Fontaine's D_dif** had no owner. They are planned in P7, from Brinon–Conrad §15
  (restructure 14).
- **Ax–Sen–Tate, Tate's traces and Tate–Sen** go to R06.1, and Tate's C(ψ) theorems to R06.2
  (restructure 11).
- **The Hodge–Tate weight convention** (HT(χ_p) = +1) is defined in R06.2, and R06.4 keeps the sign
  dictionary for each source.
- **The Colmez–Fontaine theorem** is stated in R06.2, with its reduction to the bigness criterion and the
  rank-one case proved there. Its proof after Berger 2008 needs P7, PG.1–PG.2 and RD.1–RD.2, so the
  proposal places it in R06.3 or a stage after P7 (restructure 9, gap).
- **Owners still wanted:**
  - for Scholze's primitive comparison theorem (restructure 5);
  - for the crystalline comparison with coefficients, proposed as CP.2 (restructure 6);
  - for logarithmic semistable period sheaves (restructure 7).
- **Sub-layers:** P7 splits into the Robba dictionary and the Wach comparison; P8:local-rational and R06.1
  are split for the atlas.

## What remains

Every stage is `partial` except P7:annulus-foundations, which is `source_decomposed`. The coverage entries
list the remaining items precisely.

**Main gaps:**
- the transcendence of log[p̃] and H¹(H_K, W(m)) = 0, which rest on Fontaine's and Colmez's unavailable
  papers;
- the Wach versus Breuil–Kisin comparison, and the Herr-complex import with its normalisations;
- the injectivity of A_cris → B_dR⁺ and of B_cris⁺ → B_dR⁺ on the pro-étale site;
- Brinon's description of A_cris(R, R⁺)/p;
- the packet-authored semistable period sheaves;
- the proof of the Colmez–Fontaine theorem;
- Fontaine–Laffaille Theorem 8.4, which rests on Fontaine's Annals 1982 ring, and the essential image of the
  FL lattice functor;
- the independence of the Weil–Deligne recipe from the choices, where Breuil–Mézard was not read. A
  packet-authored proof is given.

**Follow-up for the rigid-cohomology packet** (gap "RD.2 export …").
`PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` states the dimension of
the solution space over L ∩ F^nr. It should be over the constant field F'_L, which can be larger:
Q_3(√−6) is an example. R06.3's monodromy node reads it correctly and enlarges L. That packet is not a
deliverable of this job, so it is left for its next revision.

**Requests (28):**

| owner | stages |
| --- | --- |
| PhiGammaModulesAndIwasawaCohomology | PG.0, PG.1, PG.2 (two each), PG.3, PG.5, PG.6 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.3 (2), R07.4 (2) |
| CrystallineCohomology | CR.0 (2) |
| AInfCohomology | AI.3 |
| AdicEtaleGeometry | A1, A2 |
| ClassicalAdicEtaleCohomology | H0 |
| AdicSpacesPartII | R0, R2, R3 |
| CohomologyComparisons | CP.3, CP.4 |
| AlgebraicModuliForArithmeticGeometry | A0-extension |
| ArithmeticGaloisRepresentations | R01.1, R01.2 |
| Tau Ceti LocalFieldsRamification | layer 3 |

## Numerical checks

All were run in PARI/GP; the roadmap document lists them.
- **Robba rings:**
  - the valuations of the coefficients of t = log(1+π);
  - a series in E but not in R;
  - Newton slopes of Φ_{p^n}(1+x).
- **Period sheaves and rings:**
  - γ − 1 on the power-series model;
  - θ(φ(ξ)) ≠ 0;
  - Nφ = pφN.
- **Frobenius and filtrations:**
  - a_p and T² − a_pT + p for ordinary and supersingular curves;
  - t_N = t_H = −n for Q_p(n);
  - a filtered module that is not weakly admissible, and a rank-2 module whose weak admissibility depends
    on N;
  - Brinon–Conrad's Example 8.1.3.
- **Tate curve:** the Weil–Deligne normalisation on 11a1 at p = 11 and 15a1 at p = 3.

## Sources

All sources were read from public copies on 25 September 2026. The packet has the URLs, full hashes and
sections read.

| id | edition | SHA-256 |
| --- | --- | --- |
| brinon-conrad | CMI notes, 2009 preliminary version | `f27d508b…` |
| fontaine-ouyang | book draft (Université Paris-Saclay page) | `56590ae4…` |
| berger-intro | arXiv:math/0210184v1 | `fac038cb…` |
| berger-2002 | arXiv:math/0102179v3 (Invent. Math. 148) | `142e7948…` |
| berger-2004 | Compos. Math. 140 (2004), author PDF | `52e18821…` |
| berger-2008 | arXiv:math/0406601v1 (Astérisque 319) | `72559978…` |
| berger-errata | author's errata list, May 2026 | `3a8db18e…` |
| kedlaya-liu | arXiv:1301.0792v5 | `a6a11742…` |
| kedlaya-overview | arXiv:math/0501361v2 | `31d9e39e…` |
| lazard-1962 | Publ. Math. IHÉS 14, numdam | `8d18aea9…` |
| sch13-padic-hodge | author's version, 3 Nov 2012 | `73dded06…` |
| sch16-erratum | author's erratum | `3cfa56b9…` |
| scholze-arxiv | arXiv:1205.3463v2 | `ed9187b3…` |
| tan-tong | arXiv:1510.05543v2 | `1de1a71b…` |
| colmez-2002 | J. Inst. Math. Jussieu 1, author PDF | `3675d316…` |
| fontaine-laffaille | Ann. Sci. ÉNS 15 (1982), numdam | `c049a7bf…` |
| breuil-schneider-2007 | arXiv:math/0603499v1 | `82f3f514…` |
| allen-2016 | arXiv:1411.7661v2 | `3674da65…` |
| kw-serre-modularity-I | Khare–Wintenberger I, author's copy | `3c389dc3…` |

**Not accessible, and never cited as read:**
- Fontaine's Astérisque 223 and 295 papers, and his Annals 1982 paper;
- Colmez–Fontaine;
- Cherbonnier–Colmez;
- Brinon's Mémoire SMF 112;
- Breuil–Mézard.
