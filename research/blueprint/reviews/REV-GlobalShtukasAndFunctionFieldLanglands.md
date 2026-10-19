# REV-GlobalShtukasAndFunctionFieldLanglands — independent review

Reviewer: Claude (session claude-Fg16b8), job `REV-GlobalShtukasAndFunctionFieldLanglands`, issue #516, 2026-10-19.
Reviewed work: `BP-GlobalShtukasAndFunctionFieldLanglands` (Codex, session codex-4r7Y8v, #10524), the complete target-level pass through GS.0–GS.7.

**Verdict: accepted with corrections.** All eight stages remain `planned`. Every node is `corrected` in the review object. No node was added or removed.

## Counts

| | Before | After |
| --- | --- | --- |
| Nodes | 104 | 104 (5 moved between stages) |
| Source entries | 113 | 120 (7 split out of cross-source locators or added) |
| `match` fields that copied the node statement | 104 | 0 |
| Locators rewritten | — | 99 |
| API items / unit tests | 122 / 99 | 123 / 99 |
| Planets | 38 | 38 (at most 6 per stage) |
| Requests | 25 | 24 (SF.2 and FA.5 removed, SR.4 added) |
| Gaps | 9 | 10 (G10 added) |
| Restructure entries | 6 | 8 |
| Within-roadmap stage cycles | 3 | 0 |
| `check_blueprint.py` (with the pinned index) | 0 errors | 0 errors, 0 warnings |

## Sources

All 16 sources were downloaded and hashed. Fifteen match the packet. The Yun–Zhang file at the recorded v1 URL is a different PDF: the packet's hash is that of **arXiv v2** (13 June 2020, 90 pages), and the locators follow v2's numbering, where v1 numbers the results of §3.4 one higher. The edition, URL, source-version record and all YZ locators now name v2.

Every source entry was checked at its locator against the page-marked text of the downloaded file. A Haiku retrieval pass collected the cited statements, and I read the quoted lines myself before writing any match.

- **Matches.** 104 of the 113 `match` fields were verbatim copies of the node statement, so they did not say what the source states. All 113 are rewritten in my own words from the cited page. Two Sonnet agents then checked every claim of the 120 new entries, clause by clause, against the page texts. They flagged 14 imprecisions in my wording (for example the direction of the bound shift in VL Lemma 3.1, Henniart's B.11 mistaken for Jacquet–Shahidi–Shalika, and a remark one page off), and all 14 are corrected. Where the node adds something the source does not state, the match now says so. Examples: VL's §15 assumes split G and empty level; YZ §3.2.3 speaks of Drinfeld modules, not elliptic sheaves; Schiffmann treats coherent sheaves, not G-bundles.
- **Locators.** About 40 named something that does not exist at the cited place. The rest were made precise.
  - VL chapters 1, 2 and 8 have no numbered subsections, so `§1.1`, `§1.2`, `§2.1`, `§2.2` and `§8.1`–`§8.6` became chapter references.
  - VL "Definitions 1.4 and 1.7" are Remark 1.4 and Notation 1.7; the definition is 1.6.
  - VL "Lemmas 8.31–8.32" are Propositions. VL "Lemmas 8.5–8.9" include three Remarks, and the statement itself is Lemma 8.11 on p. 111.
  - VL "(8.18)" does not exist; the cuspidality definition is Notation 8.22.
  - VL §14 is the metaplectic chapter; the conjectural multiplicity formula is Remark 0.30, (0.43), pp. 27–28.
  - Varshavsky has no "Definition 2.2" or "§3.1" content at pp. 2–3 and 8; the bundle stack and its bounded opens are Notation 2.1, p. 4.
  - Schiffmann's Appendix A is printed p. 356; pp. 359–361 are the bibliography.
  - L. Lafforgue: III.2 is a Theorem, III.4 a Corollary, VI.14 a Definition and VII.4 a Proposition. Definitions I.1–I.2 are on pp. 17–19, truncations are §I.1d (pp. 20–22), Theorem IV.12 is on p. 110 and Theorem V.19 on p. 142. Appendix B, B.10–B.13, is on pp. 227–231.
  - GL has no §2.5; Remark 6.3 starts on p. 39.
  - Lusztig–Yun's "published Lemma 4.3(3), §4.4" could not be checked against the arXiv text and was removed.
- **Cross-source locators.** References to another source inside one locator became their own entries: Varshavsky Proposition 2.16, VL Remarks 1.19 and 1.21, GL Remark 1.6, LL Corollary VII.5 and Yu §2.3. VL §12.1 was added as the source for Heinloth's algebraicity of Bun_𝒢 and for the nonsplit finite-type truncations.
- **Misattributed sources.** GS.0/picard-and-the-gl1-case cited a Lang-isogeny argument "in the proof of VL Lemma 8.2", and there is none. It now cites LL's proof of Proposition VI.11, p. 159 (rank one by class field theory), and its FA imports.
- No verbatim excerpt is recorded anywhere in the packet.

## Statements corrected after reading the source

- **GS.3/integral-cuspidal-finiteness.** The packet said sufficiently large truncations inject into the full cohomology. Xue proves that the cuspidal submodule lies in the *image* of one truncation (Proposition 3.2.2). The statement and proof step are corrected, and no injectivity is asserted.
- **GS.1/unramified-hecke-algebra-and-satake-isomorphism.** The classical Satake isomorphism is now imported from SmoothRepresentationsOfLocalGroups SR.4 (new request; upstream §SR.4.1). The statement records VL p. 51: the h_{V,v} are integral and form an O_E-basis, and h_{V,v}=(−1)^⟨2ρ,ω⟩Tr(Frob_v,S_V).
- **GS.2/truncations-and-finite-type.** "The source's appropriate proper open subset" is now the exact condition: over U^I for every open U⊊X when N is empty (VL Proposition 2.6(a)).
- **GS.7/gl-r-local-comparison-and-uniformization.** It imported HS2/local-shtuka-moduli, which is stated for E=Q_p only. It now uses HS2/general-local-field, stated for local fields of either characteristic.
- **Tests.**
  - The G_m Beilinson–Drinfeld test claimed the fibre is the discrete set Z. That holds for geometric points but not on nonreduced test rings; corrected.
  - The PGL₂ half-twist test said the twist "exchanges the two flags". It is rewritten as the actual lattice-chain rotation, whose square is ⊗O(x).
  - Four test kinds were wrong (two non-examples, one compatibility, one computation).
  - The 99 test names were `check_1`–`check_3` on every node. They are now descriptive and distinct (e.g. `BunG.gl1_picard_stack_automorphisms`).

## Baseline

All eight `baseline.declarations` were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The names are AlgebraicGeometry.Scheme, CategoryTheory.GaloisCategory (extending PreGaloisCategory with a fibre functor), CategoryTheory.Pseudofunctor.DescentData, CategoryTheory.Pseudofunctor.IsStack, ExteriorAlgebra, LinearMap.charpoly (finite free modules), Module.Finite and Submodule.FG. Each exists under that name, and each provides what the citing nodes claim. None was removed.

## Closure, structure and suppliers

- **Stage cycles.** The node prerequisites implied three within-roadmap stage cycles. Each was removed by moving nodes to the stage whose target they serve:
  - GS.2↔GS.3: pgl2-finite-type-core uses Lemma 3.28 (horocycle geometry); it moved to GS.3.
  - GS.3↔GS.4: the finite-envelope theorem, the specialization isomorphism and H_{I,W} use Drinfeld's lemma and the product Galois action; they moved to GS.4, whose description asks to "justify its use on the Hecke-finite sector".
  - GS.3→GS.5: the conjectural-decomposition boundary node moved to GS.5.

  Node ids are unchanged. All stage edges now point downward, and the in-memory `merge_blueprints` build succeeds with no skipped links.
- **Near-miss suppliers replaced.**
  - LP2:semisimple-characters/GL-trace-pseudocharacters is a group-algebra adapter, not a reconstruction theorem. It is replaced by IntegralHeckeAndGaloisDeterminants IHG.1/algebraically-closed-reconstruction and IHG.0/determinant-trace-injective.
  - The bare SF.2 stage (Galois categories of schemes) is replaced by the accepted InverseGaloisAndArithmeticFundamentalGroups IG.0/finite-etale-covers and IG.0/etale-fundamental-group, and the SF.2 request is withdrawn.
  - Module-level Beauville–Laszlo gluing is RelativeFarguesFontaine RF4:vector-bundles/beauville-laszlo-module-gluing.
  - Every new supplier's prerequisite closure was computed over all packets and atlas stages, and none reaches a GS node.
- **Request texts.**
  - The EDC.8 request named ET.5 and a nonexistent "EnhancedDerivedSheaves trace owner"; it now names the scheme-level EDC.8 nodes and asks for their stack versions.
  - The SF.1 request said AlgebraicVectorBundles "Layers 0–4" supply relative Grassmannians. That roadmap has Layers L0A–L2B and leaves Grassmann bundles to a successor; AlgebraicModuliForArithmeticGeometry §1.3 has them. Corrected here, in the upstream note and in the reader.
  - DWP.0, DWP.7, EDC.0 and EDC.2 now name the existing scheme-level nodes and say that only the stack versions are requested. EtaleDualityAndPerverseSheaves is scheme-only, and its stacks Part II is the EDC assembly proposal.

## Ownership against lower tiers and TauCetiRoadmap

The plan was written after two lower-tier packages had moved GS material down, and it did not record either move:

1. **AutomorphicLFunctionsAndLocalFactors** (TauCetiRoadmap #924, reviewer recommends approval), layer AL.3, plans L. Lafforgue's GL_r correspondence at every level. That covers curve HN theory, two-leg shtukas and compactifications, leg-in-level counting, intersection-cohomology and essential comparisons, the leveled ramified rank induction, the counting formula, the function-field converse theorem, strong multiplicity one and rank-one reciprocity (PKG-AutomorphicLFunctionsAndLocalFactors, "GS.6 → AL.3").
2. **EndoscopicTransferAndUnitaryTraceComparison** (#999) §3.1 plans Bun_G of a quasi-split reductive model on the fixed curve, and §3.2 the local loop Grassmannian over any field (PKG-EndoscopicTransferAndUnitaryTraceComparison).

Both lower atlas packets still cite the GS nodes: AL.3/function-field-cuspidal-polynomial, AL.3/function-field-self-pair-reflection and AL.2/standard-superpositivity, and ET.0's ET.2b. Making GS cite them back would close stage cycles. I therefore did not remove or convert any GS node. I recorded:

- two `restructure` entries saying which GS nodes become comparison receipts once AL and ET cite their own package sections, and what GS keeps;
- two upstream notes;
- an acceptance check on each affected node naming the owning subsection;
- gap **G10**. The FA.5/FA.6 "Part II" requests for Rankin–Selberg, Laumon's product formula, the converse theorem, multiplicity one and the I.13 trace formula were misdirected: AL owns them upstream. The FA.6 request now asks only for nonsplit compact cusp support modulo Ξ, extending FA.6/harder-cuspidal-support.

The other upstream roadmaps on TauCetiRoadmap main (2026-10-19, `a62dcbae`) duplicate no GS target. I checked GeometricRepresentationCategories, SchubertGeometry, AffineLieAlgebras, AlgebraicVectorBundles, SchemeAndStackFoundations, ReductiveGroups and AlgebraicCurves. GeometricSatakeAndFusion is the Fargues–Scholze direction, and the classical Satake isomorphism is SR.4.

## Requests from consumers, checked against this packet

- **CountingBundlesAndHallAlgebrasOfCurves → GS.0** is met by GS.0/slope-euler-and-hn-data, /harder-narasimhan-truncations and /bundle-and-torsion-masses. The hereditary property of Coh(X) was missing and is now an API item.
- **SheafTheoreticSmithTheory → GS.1** needs the field-independent local Grassmannian. That is met by ET §3.2 upstream, as recorded in the restructure entry.
- **HodgeStructuresPartII H.5 → GS.6** also asks for Drinfeld's higher-dimensional companions. These are outside GS.6 and are now recorded in its coverage as Part II material.
- **AutomorphicLFunctionsAndLocalFactors → GS.6** and **MetaplecticAutomorphicForms → GS.5** are met as planned. The former is the ownership loop described above.

## Red-team findings handed to the plan

- **RT-AREA-langlands-1/12.** GS.0 and GS.1's geometric prefix are exported to ET.2b before Satake, as the finding requires. The ET package has since taken these constructions into its own layers, and the new ownership entry records that.
- **RT-AREA-geomlanglands/25.** GS.5 imports the abstract excursion presentation and arbitrary-Γ reconstruction from LP2 and only verifies the identities on global cohomology, which is correct.

## Source findings (`sourceIssues`)

All six were checked at their locators and are **confirmed**.

- E1–E3 (YZ §3.5.4, p. 38) are present in v2 and v1. They match PAPER-YUN-ZHANG-19/E12–E14, and the locators now name v2.
- E4 is PAPER-FENG-24/E36.
- E5 is L. Lafforgue's own correction of his 1997 book, in the remark after Theorem I.13.
- E6 is new: Xue Lemma 8.2.4. Its proof claims every quotient A/m^n is finite and torsion over O_E. That fails for A=O_E[t] and m=(λt−1), where A/m=E. The plan's two-case repair is correct. If λ∉m, then A/m is a finite extension of E, M/m^nM is a finite-dimensional E-space containing a π_1^geom-stable lattice by the continuity convention of 8.2.3, and the E-coefficient Drinfeld lemma applies. Proposition 8.2.6 is unaffected.

## Suggested file and planets

`lean-check research/blueprint/suggested/GlobalShtukasAndFunctionFieldLanglands.lean` exits 0 at the pins, with only proof-placeholder warnings. The only change was a docstring that cited VL "8.20" for the definition, which is Definition 8.19. The file's light definitions and examples (integral Hecke-finiteness, the monic-recurrence box, the inverse-ℓ counterexample, the Jordan block) were checked by hand and are true. The planets are key objects and named theorems, at most six per stage.

## Reader

The reader is rebuilt from the corrected packet. Its node sections, supplier contracts, gaps, corrected source formulas, source versions and coverage table were first shown to re-render from the HEAD packet byte for byte. They were then re-rendered, with the five moved sections relocated. Three front-matter paragraphs and the GS.6 introduction were edited for the ownership and AlgebraicVectorBundles corrections.

Escaping now follows the site renderer (`src/markdown.js`). The HEAD reader wrote `\[2r\](r)`, which that renderer shows as display mathematics, so only the opening bracket is escaped. `*` is escaped, and `_` is escaped where it follows a non-ASCII-word character. A markdown-it pass shows that the six spurious emphasis spans of the HEAD reader are gone; the only emphasis left is the 16 italic source titles.

## Questions for the orchestrator

1. Apply the two new ownership entries. AL's and ET's atlas packets should cite their own package sections instead of GS.6 and GS.0/GS.1. After that, the listed GS nodes become comparison receipts, and G10 closes by citing AL.3.
2. HodgeStructuresPartII H.5 needs Drinfeld's higher-dimensional companions. A GlobalShtukas Part II, or the planned crystalline-companions Part II, should own them.
3. Nine gaps remain as source obligations (G1–G9) and one ownership gap (G10). They are follow-up work, not reasons to send the plan back.
