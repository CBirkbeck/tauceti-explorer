# Independent review R2 — integral-cohomology packets

Reviewer: independent-review-R2. Date: 2026-09-15. Scope: the four draft packets
`research/expansion/drafts/AInfCohomology.json`, `CrystallineCohomology.json`,
`DerivedDeRhamCohomology.json`, `PrismaticCohomology.json`. Method: every node statement,
hypothesis list, proof step, acceptance item, locator and excerpt was compared with the
cited passage of the supplied text extractions (line numbers below refer to those
extractions; printed pages are inferred from the page headers in them). Every link was
checked for direction, for the exact place where the consumer's proof uses the source
node's output, and for existence of both endpoints. Every `parentStageId` and every
coverage `stageId` was checked against `data/atlas.json` (existence and owner roadmap).
Supplier stages were checked by reading their atlas descriptions. Implementation status
was left `unchecked`; a grep of the TauCeti project and mathlib only informed gap text.
Each packet now carries a top-level `review` object with per-node verdicts; packet
`status` stays `partial`.

Editions actually inspected (stamps on the first extracted page; SHA-256 of each
extraction matches the packet's `sources` entry):

| Source | Stamp in extraction |
| --- | --- |
| BMS1, Integral p-adic Hodge theory | `arXiv:1602.03148v3 [math.AG] 15 Jan 2019` |
| BLM, Revisiting the de Rham–Witt complex | `arXiv:1805.05501v3 [math.AG] 19 Feb 2020` |
| Bhatt, p-adic derived de Rham cohomology | `arXiv:1204.6560v1 [math.AG] 30 Apr 2012` |
| BS, Prisms and prismatic cohomology | `arXiv:1905.08229v4 [math.AG] 12 Jan 2022` |

Summary of verdicts (nodes): AInf 5 verified / 2 corrected / 0 unverifiable;
Crystalline 6 / 1 / 0; DerivedDeRham 3 / 4 / 0; Prismatic 5 / 3 / 0. All four packets:
review status `accepted` (every node and link verified or corrected; no unresolved
contradiction inside a packet). Two items need an orchestrator decision (end of file).

---

## 1. AInfCohomology.json (scope AI.1, derived décalage Lη)

Source range read: BMS1 §6 opening and §§6.1–6.2, extracted lines 2981–3353, printed
pp.49–55. Also read: Stacks Project Tag 077J (public page, Cohomology on Sites,
Lemma 21.17.10), cited by BMS1 Lemma 6.1.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| AI.1/ideal-decalage-complex | corrected | Title misspelled "Décalage"; fixed. Definition 6.2 (lines 3008–3021) defines the differential by the commutative diagram `d_C⊗id : (η_I C)^i → I·C^{i+1}⊗I^{⊗i} ≅ C^{i+1}⊗I^{⊗(i+1)}`; the packet's "induced by the inclusion I C^{i+1}⊂C^{i+1}" was replaced by this description. Remark 6.3 (lines 3023–3027): principal chart and the shift isomorphism `η_I(C[1])≅(η_I C)[1]` by multiplication by f, now recorded. Excerpt "not on a chosen" is at line 3023. |
| AI.1/decalage-cohomology | verified | Lemma 6.4 and proof (lines 3029–3053): `H^i(η_I C)=(H^i(C)/H^i(C)[I])⊗I^{⊗i}` with `H^i(C)[I]=Ker(H^i(C)→H^i(C)⊗I^{⊗−1})`; cycle identification, surjection and the lift criterion match the proof steps. Excerpt "killing the I-torsion" at line 3028. |
| AI.1/derived-decalage | verified | Lemma 6.1 (lines 2998–3004), Corollary 6.5 (3055–3061), Remark 6.6 (3063–3065). Corollary 6.5 asserts commutation with filtered colimits and canonical truncations without proof; the proof step was reworded to say so. Non-exactness example `Lη_p(Z/p)=0`, `Lη_p(Z/p²)=Z/p` matches. |
| AI.1/decalage-products | verified | Proposition 6.7 and proof (lines 3067–3080): termwise map from `I^{⊗i}⊗I^{⊗j}→I^{⊗(i+j)}` and the signed Leibniz check `d(x⊗y)=dx⊗y+(−1)^i x⊗dy` match; Lemma 6.13 (3206–3212) for dg-algebras. Line numbers were added to the locator. |
| AI.1/bockstein-reduction | verified | Proposition 6.12 (3148–3159) and proof (3164–3202): map `(η_I C)^n→Z^n(C/I)⊗I^{⊗n}`, reduction to `H^0`, injectivity via a lift `β` with `dβ−α∈I·(η_I C)^0`, surjectivity via a lift to `C/I²`. The proof's uncited claim that the underived tensor with `O_T/I` computes the derived one for I-torsion-free complexes (lines 3164–3166) was added as a proof step. |
| AI.1/preservation-derived-completeness | corrected | Title misspelled "Décalage"; fixed. §6.2 opening (3233–3246): replete topos, J locally finitely generated. Lemma 6.15 is quoted from [11, Prop. 3.4.4, Lemma 3.4.14] (line 3251); Lemma 6.19 (3326–3331) kernel/cokernel argument matches; "not true in general" at line 3333. |
| AI.1/completion-at-decalage-ideal | verified | Lemma 6.20 (3334–3353): both maps and their direction match; existence of the first map from I-adic completeness of `Lη_I Ĉ` (line 3343); reduction mod f and "the Bockstein stays the same" (3346–3348); pro-quasi-isomorphism `D→{D⊗^L O_T/f^n}` (3351–3353). The uncited derived Nakayama step (3344–3346) was added as a proof step and to the completion gap. |

### Links (10)

All directions correct; the usage site of each source node's output was located and the
locator replaced by lemma and line references (previously "§6.1–6.2, cited proofs"):
6.2→6.4 (proof lines 3040–3053); 6.4→6.5 (line 3054); 6.5→6.7 (3071–3080);
6.2→6.12 (3167–3171); 6.4→6.19 (3328–3331); 6.19→6.20 (line 3343); 6.12→6.20
(3346–3348). Supplier `DerivedDeRhamCohomology:DD.1`: its description covers the
cohomology criterion/Serre-subcategory closure ("conservativity of reduction on derived
complete objects", "comparison with Rlim of derived Koszul quotients") used by Lemmas
6.15/6.19/6.20 — scope adequate. Export `AI.1/bockstein-reduction → CrystallineCohomology:CR.4`:
BLM proves Proposition 2.4.5 itself and only remarks (BLM p.17, lines 694–697) that it
"appears in [BMS18, Prop. 6.12]"; the link reason now says it records a shared result,
not an import. CR.4's atlas description names AI.1 as its Lη supplier, so the edge is
consistent with the atlas.

### Structure

`parentStageId` AInfCohomology:AI.1 exists, owner AInfCohomology. All ten coverage
stage ids exist (AI.0, AI.0:integral, AI.0:period-comparison, AI.1–AI.7). The AI.1
"remaining" list was rewritten: Tag 077J is now read (see gap), [11, §3.4] remains
unread, and Proposition 6.8, Lemmas 6.9–6.11, 6.14, 6.17–6.18 (in the read range, not
decomposed; 6.10–6.11 needed by AI.3) were added; a matching gap was added.

### Gaps

Tag 077J: read on the public Stacks page. Statement: for any complex `G•` of O-modules
on a ringed site there are bounded-above complexes `K_n•` with terms direct sums of
`j_{U!}O_U`, termwise split injections `K_n•→K_{n+1}•`, and `colim K_n•→G•` a
quasi-isomorphism; proof cites Modules on Sites 18.28.8, Derived Categories 13.29.1 and
exactness of filtered colimits. BMS1's "strongly K-flat" claim additionally needs
flatness of `j_{U!}O_U` and K-flatness of bounded-above flat complexes and of their
filtered colimits — those auxiliary tags were not read; gap text updated accordingly.
[11, §3.4] (Bhatt–Scholze, pro-étale topology, Astérisque 369): not read; remains a gap.
Library: no décalage/Lη in the TauCeti project (the only "Dieudonné" hits are the
Cartan–Dieudonné theorem); gap text updated.

---

## 2. CrystallineCohomology.json (scope CR.4, Dieudonné complexes)

Source range read: BLM §§2.1–2.5, extracted lines 517–828, printed pp.13–20.

Edition: the extraction's first page is stamped `arXiv:1805.05501v3 [math.AG] 19 Feb 2020`
(line 2), confirming the handover's belief; the last printed page header in the file is
157. The packet's edition label "Supplied 158-page arXiv edition" was replaced by exactly
what the file shows. The fixed-prime convention is at lines 237 and 463.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| CR.4/dieudonne-complex | verified | Definition 2.1.1 (518–524), Construction 2.1.3 (534–538: `(η_pM)^n={x∈p^nM^n: dx∈p^{n+1}M^{n+1}}` inside `M[p^{-1}]`, footnote: `η_pM⊆M` in nonnegative degrees), Remark 2.1.4 (539–549: `α_F(x)=p^nF(x)`, inverse `F=p^{-n}α`, "These constructions are inverse"). Statement expanded to carry the explicit formula; no error. |
| CR.4/saturated-frobenius | verified | Definition 2.2.1 (556–560) and Remark 2.2.2 (563–565). |
| CR.4/verschiebung-identities | verified | Remark 2.2.3 (566–570), Proposition 2.2.4 and proof (571–580): `FV=p` by definition, injectivity of V from p-torsion-freeness, `VF=p` by cancelling the injective F, `FdV=d` by cancelling p, `Vd=p dV` by postcomposition. |
| CR.4/iterated-frobenius-divisibility | verified | Proposition 2.2.5 and proof (583–596), Remark 2.2.6 (597–599). |
| CR.4/saturation-colimit | corrected | Proposition 2.3.1 (611–621): transition maps of display (8) are `α_F, η_p(α_F), η_p(η_p(α_F)),…`, not "iterates of α_F"; fixed. The universal-property definition (600–610) added to the statement. The source gives the torsion-quotient reduction and the "is a saturation" conclusion without detail; proof steps now say which checks are packet-authored. |
| CR.4/cartier-saturation-mod-p | verified | Definition 2.4.1 (666–672), Theorem 2.4.2 (676–678), Remark 2.4.3, Construction 2.4.4, Proposition 2.4.5 and proof (698–727), Corollary 2.4.6 (728–737), proof of 2.4.2 (738–764). Locator line range trimmed from 662–770 to 661–764 (765–770 belong to §2.5). Colimit step annotated. |
| CR.4/verschiebung-completion-tower | verified | Construction 2.5.1 (770–781), Remark 2.5.2 (782–811), Remark 2.5.3 (812–828). Locator corrected from 775–818 to 767–828 (Construction starts at 770; Remark 2.5.3 ends on p.20 at 828). `Res`, `ρ_M` and functoriality added to the statement. |

### Links (9)

Internal links verified at: Remark 2.2.2 (563–565); Remark 2.2.3/Prop. 2.2.4 (566–580);
Remark 2.5.2 (782–811); Prop. 2.2.5 proof (587–596); Prop. 2.3.1 proof (613–621);
Theorem 2.4.2 proof (738–748). Cross-roadmap links from AInfCohomology:AI.1 nodes: all
three point the right way (AI.1 → CR.4) and are consistent with CR.4's atlas requires;
their reasons were rewritten because BLM defines `η_p` directly (Construction 2.1.3),
uses the elementary *underived* filtered-colimit property of `η_p` (line 616, asserted),
and proves the Bockstein comparison itself (Proposition 2.4.5) — they are shared
constructions/results, not imports on which BLM's proofs depend.

### Structure

`parentStageId` CrystallineCohomology:CR.4 exists, owner CrystallineCohomology. All
eleven coverage stage ids exist. CR.4 "remaining" gained Remarks 2.3.3–2.3.4. New gap:
elementary facts asserted without proof in §§2.1–2.5. Library gap updated (no Dieudonné
complexes in the project).

---

## 3. DerivedDeRhamCohomology.json (scope DD.2–DD.3)

Source range read: Bhatt §1.5 (170–221), §2 (232–323), §3 opening and §§3.1–3.2
(325–408), printed pp.3–7 (page numbers are printed at the foot of each page in this
extraction: line 177 = p.3, 236 = p.4, 292 = p.5, 354 = p.6, 412 = p.7). The reviewer
additionally read Corollary 3.8, Corollary 3.10 with proof, and Remark 3.12 (lines
415–446, p.8) to fix the completion boundary.

### The DD.2 completion boundary

The packet did not claim an unrestricted equivalence with ordinary smooth de Rham
cohomology: node DD.2/polynomial-resolution-derham explicitly disclaims it and node
DD.2/characteristic-zero-completion-boundary states Corollary 2.5. The wording was
nevertheless tightened to exactly what the source says:

* Corollary 2.5 (line 293): `A ≃ dR_{B/A}` for every map of Q-algebras; proof by the
  vanishing of polynomial de Rham cohomology in characteristic 0 and convergence of the
  conjugate spectral sequence (295–299).
* Remark 2.6 (301–308): the Hodge-completed complex (product totalisation) is the fix;
  its Hodge-to-de Rham spectral sequence converges and it "specialises to classical de
  Rham cohomology for smooth maps" — asserted, not proved; cites [Bhaa] for the
  comparison with Hartshorne's algebraic de Rham cohomology. The node now says the
  completed comparison is asserted, not proved, in the inspected range.
* The Laurent-polynomial example the packet used is the source's own: Remark 3.12
  (442–446) "Q→Q[x,x^{-1}] has a one-dimensional (usual) de Rham cohomology group of
  degree 1 (with generator dx/x), but no derived de Rham cohomology". A second source
  entry was added to the node.
* Characteristic p: Corollary 3.10 (430–439) gives `dR_{B/A}≃Ω•_{B/A}` for smooth maps
  of Z/p^n-algebras (uncompleted), via devissage, base change, conjugate convergence and
  [Ill71, Prop. III.3.1.2]. Read but not decomposed; recorded in the node statement, the
  DD.2 coverage item and the gap as the exact boundary.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| DD.2/polynomial-resolution-derham | corrected | Definition 2.1 (239–242) uses the canonical free resolution; that any free resolution works is asserted ("One can show", line 248, citing [Ill72, §VIII.2.1.1]). Statement now says so and records the E∞ structure and the decreasing separated exhaustive multiplicative Hodge filtration (246–247). Excerpt at line 244. |
| DD.3/conjugate-filtration | verified | Proposition 2.3 (258–264), proof (265–277), Remark 2.4 (278–286), conservativity corollary (287–291). |
| DD.2/derived-base-change-kunneth | verified | Proposition 2.7 (313–322); "where all tensor products are derived" (319). |
| DD.3/derived-frobenius-twist | corrected | Notation 3.1 (331–353). The source says B^(1) coincides with the underived twist *if* `Tor_i^A(Frob_*A,B)=0` for i>0 (334–337); the packet's "only when" was an overstatement and was replaced by the source's sufficient condition. B^(1)-linearity of the conjugate filtration is Proposition 3.5 (392–394), not Notation 3.1; a second source entry was added. |
| DD.3/polynomial-cartier-map | corrected | Theorem 3.2 (357–361) is an isomorphism of F^(1)-modules `∧^k L_{F^(1)/A}≃H^k(Ω•_{F/A})`; proof (362–376) and Remark 3.3 (377–385) match. The one-variable formula `dt↦[t^{p−1}dt]` is a consequence of the recipe with the lift `t↦t^p`, not displayed in the source; marked as such. The source cites [DI87, Theorem 1.2] (line 356), added to gaps. |
| DD.3/derived-cartier-graded-pieces | verified | Proposition 3.5 and proof (392–407); the "hence" step uses derived exterior powers ([Qui70a, §7], line 182) supplied by DD.0. |
| DD.2/characteristic-zero-completion-boundary | corrected | See above; statement, proof step and source entries rewritten. |

### Links (8)

All directions correct; locators sharpened to: Prop. 2.3 proof (265–272); Prop. 2.7
proof (321–322); Thm 3.2 statement (357–361); Prop. 3.5 proof (399–401, 402–406);
Prop. 3.5 statement (392–396); Cor. 2.5 proof (295–299). Supplier
`DerivedDeRhamCohomology:DD.0` → DD.3/derived-cartier-graded-pieces: DD.0's description
constructs `L_{B/A}` and "derived symmetric/divided/exterior power functors" — scope
adequate.

### Structure

`parentStageId`s DD.2 and DD.3 exist, owner DerivedDeRhamCohomology; all seven coverage
stage ids exist. Gaps: imported results not previously named were added ([DI87, Thm
1.2]; [Ill71, §I.3.3.2, Cor. I.3.3.4.6] for flat base change of simplicial modules,
used by the derived twist; [Qui70a, §7]; [Ill71, Prop. III.3.1.2] for Cor. 3.10).
`readSections` records the reviewer's extra reading of p.8.

---

## 4. PrismaticCohomology.json (scope PR.0–PR.1)

Source range read: BS Definition 2.1 and Remarks 2.2–2.4 (568–605, pp.13–14), Lemmas
2.23–2.25 (840–872, p.19), Lemmas 3.1–3.10 with proofs (1266–1479, pp.28–32), Corollary
3.12 and Proposition 3.13 with proofs (1512–1616, pp.33–35), Definition 4.1 and Remark 4.2
(1636–1668, p.36). Also read: §1.2 complete-flatness convention (464–476, p.11), §2
opening conventions (559–567, p.13), Lemma 3.6 with proof (1333–1363), and BMS1 Remark
3.11 (BMS1 lines 1445–1448) which Theorem 3.10 imports.

### Nodes

| Node | Verdict | Finding |
| --- | --- | --- |
| PR.0/delta-frobenius-dictionary | corrected | Definition 2.1 (573–578), Remark 2.2 (579–587), Remark 2.4 (594–605). "Conversely a lift uniquely determines δ only when the ring is p-torsion-free" overstated the source, which asserts the reconstruction `δ(x)=(φ(x)−x^p)/p` for p-torsion-free R (581–584); rephrased. The hypothesis "rings in this source section are Z_(p)-algebras" is confirmed by line 566 ("All our rings are Z(p)-algebras") and kept, with the fixed prime (line 559). |
| PR.0/distinguished-factor-rigidity | verified | Lemma 2.23 (840–848), Lemma 2.24 (850–858); excerpt "which proves both claims" at 858. |
| PR.0/local-distinguished-prism-generators | corrected | Lemma 2.25 (860–872), Lemma 3.1 (1266–1285). Statement now includes the source's `d,p∈rad(A′)` in (3). The proof's Remark 2.16 (unique δ-structure on the localizations, line 1277) is unread; added to a gap. |
| PR.0/rigidity-prism-ideal | corrected | Definition 3.2 (1286–1306), Lemma 3.5 and proof (1316–1331). The converse was missing the standing hypothesis that (A,I) is a prism; added. Excerpt at 1317. |
| PR.0/bounded-prism-complete-flatness | verified | Lemma 3.7 (1365–1375) and proof (1384–1426). BS §1.2 defines "(p,I)-completely flat" without derived completeness (464–465), and the statement of 3.7(2) omits it, but the proof uses "the derived I-completeness of M" (1415–1416) and the following remark restricts to derived complete complexes; the packet's retained hypothesis is documented as such. Imports [Sta, Tag 0622] (1387) and [BMS19, Lemma 4.7] (1409–1413) recorded. |
| PR.0/perfect-prisms-perfectoid-rings | verified | Lemma 3.8 (1427–1433), Lemma 3.9 (1434–1448), Theorem 3.10 and proof (1450–1479). Proof steps now name the imports: [BMS18, Rem. 3.11] (read: ξ generates ker θ iff its Witt coordinate ξ_1 is a unit; matching with δ(ξ) a unit goes through Lemma 2.33, unread), Lemma 3.6, Lemma 2.28, Corollary 2.31, Lemmas 2.33–2.34, universal pro-infinitesimal thickening. |
| PR.0/regular-prismatic-envelopes | verified | Proposition 3.13 (1534–1556) and proof (1560–1616): reduction to orientable base by descent (1560–1564); the second reduction to global J through property (3) and the sheaf property of `D_{(p,I)-comp}` (1565–1570) was missing and was added; adjunction of `x_i/d` (1571–1574); discreteness and d-torsion-freeness from Lemma 3.7 (1574–1576); Frobenius-pullback diagram (1586–1607); Corollary 2.44 and Corollary 2.39 (1610–1616). The uncited (p,z)-complete faithful flatness of ψ (1608) was added to the proof steps and gap. Excerpt at 1568–1569. |
| PR.1/prismatic-structure-sheaf | verified | Corollary 3.12 and proof (1512–1533), Definition 4.1 (1636–1648), Remark 4.2 (1663–1668). Uncited inputs ("standard properties" of the completed pushout, 1522–1523; faithfully flat descent for simplicial commutative rings, 1529–1530) recorded. |

### Links (13)

All directions correct; usage sites located and locators sharpened (Lemmas 2.23–2.24
proofs 843–858; Lemma 2.25 proof 871–872 and Lemma 3.1 proof 1281; Lemma 3.5 proof
1320–1326; Lemma 3.7 proofs 1420–1426; Prop. 3.13 proof 1574–1576; Cor. 3.12 proof
1518, 1522–1524). Suppliers: `DerivedDeRhamCohomology:DD.1` (description: Koszul model,
"bounded-torsion criteria used for bounded prisms, complete flatness and complete
faithful-flat descent") — adequate for Lemma 3.7 and Corollary 3.12. `CrystallineCohomology:CR.0`
(PD polynomial algebras and envelopes) — adequate for the free divided-power algebra
`A′⟨y⟩` used at lines 1612–1616; the identification with `A′{φ(y)/p}^∧` is BS Corollary
2.39, unread and recorded as a gap; reason rewritten. **Re-pointed link:** the packet
had `AInfCohomology:AI.0:integral → PR.0/perfect-prisms-perfectoid-rings`; AI.0:integral's
description covers only `A_inf=W(O_C^♭)` for the field C, whereas Theorem 3.10 needs
`A_inf(R)` and θ for every perfectoid ring R in the sense of [BMS18, §3]. The source was
changed to `PerfectoidQuotients:Q0:integral-algebra` ("integral perfectoid rings in the
scope of BS22 … the necessary A_inf/θ descriptions"), which is already in PR.0's atlas
requires and lists PR.0 as a consumer. Q0:integral-algebra's description does not name
the nonzerodivisor generator of ker θ explicitly; the link reason records that
requirement.

### Structure

`parentStageId`s PR.0 and PR.1 exist, owner PrismaticCohomology; all nine coverage stage
ids exist. PR.0 "remaining" gained Lemma 3.6 and Examples 3.3–3.4. Gaps updated (perfect
prism imports; envelope flatness inputs) and a new gap lists the uncited standard inputs
of §3 (Remark 2.16, [Sta 0622], [BMS19, 4.7], devissage, descent for simplicial rings).

---

## Validation

All four files re-parse with `python3 -m json.tool` semantics; top-level keys are the
protocol's eight plus `review`; every node has exactly the protocol's node keys; kinds
are in the allowed set; every `parentStageId` exists and is owned by the packet's
roadmap; every link, coverage and gap endpoint is an atlas stage id or a node id of one
of the four packets; the union of the four packets' links with the atlas `stageEdges`
has no cycle through a packet node; no packet contains a private path or the misspelling of
"Décalage".

## Decisions for the orchestrator

1. **DD.2 stage text.** The atlas description of DerivedDeRhamCohomology:DD.2 says
   "comparison with the ordinary de Rham complex for smooth maps" without qualification.
   The source supports: uncompleted `dR_{B/A}≃Ω•_{B/A}` for smooth maps of Z/p^n-algebras
   (Corollary 3.10); `dR_{B/A}≃A` for all maps of Q-algebras (Corollary 2.5, Remark 3.12);
   and only an asserted Hodge-completed comparison in characteristic zero (Remark 2.6).
   The packet's DD.2 coverage entry records the needed qualification; the stage text
   itself is outside this review's editing scope.
2. **Perfect-prism supplier.** Confirm the re-pointing of the perfect-prism link from
   AInfCohomology:AI.0:integral to PerfectoidQuotients:Q0:integral-algebra, or add an
   explicit statement of "ker θ is generated by a nonzerodivisor; A_inf(R) is classically
   (p, ker θ)-complete" ([BMS18, §3, Lemma 3.10/Remark 3.11]) to whichever stage is meant
   to own general integral perfectoid rings.
3. **New cross-roadmap edge.** The Prismatic packet's link
   `DerivedDeRhamCohomology:DD.1 → PR.1/prismatic-structure-sheaf` (completed faithfully
   flat descent in the Corollary 3.12 proof) has no counterpart in the atlas: DD.1 is in
   PR.0's `requires` but not PR.1's. Integrating the packet therefore adds a DD.1 → PR.1
   stage edge (acyclic; checked against `stageEdges`), unless the orchestrator prefers to
   route the descent input through PR.0. All other cross-roadmap link sources are already
   in the consumer's parent-stage `requires`.
