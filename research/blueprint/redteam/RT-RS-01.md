# RT-RS-01

Red team of the accepted restructuring proposal RS-01, *p-adic cohomology constructions and their comparisons*. It
covers the seven roadmaps AInfCohomology, CohomologyComparisons, CrystallineCohomology, DerivedDeRhamCohomology,
PadicHodgeTheory, PerfectoidQuotients and PrismaticCohomology. Issue #4387.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the proposal (ChatGPT Pro, `astra-20260921-f6b2d8`, PR #928);
- its review REV-RS-01 (`cc-442dc5`, PR #2288).

I have edited no file of the seven member roadmaps.

**Disclosures.** I wrote FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 (#5263) and FIX-RT-AREA-padic-2~2 (#5266). Findings /1,
/3, /5 and /9 quote or cite them: the BMS-18 routes of Lemma 4.9, Proposition 13.21 and the coherence node. Each carries
a coordinator note and rests on the packets, the accepted decompositions and the BMS1 text. For /3, whose suggested
owner of Proposition 13.21 comes from my fix, the fix job should choose the owner independently.

**Result: 32 findings, 4 high, 17 medium and 11 low.**

The stage graph is fine: with all 33 accepted restructurings applied, every RS-01 link lands, there is no cycle and all
61 family stages remain. The high findings are node-level cycles that the stage graph cannot see, and one target left
without an owner.

## Method

**The passes.** Three parallel passes were run by this session:
- the CP.0 narrowing and its four owners;
- the CP.5 narrowing, AI.5 and the new CP.3 → CP.2 link;
- duplication left unresolved, library claims, the report's and the review's claims, and Tau Ceti.

They worked against the stage texts and READMEs, the packets, the accepted decompositions of CohomologyComparisons and
PadicHodgeTheory, the stage graph, the other accepted restructurings and paper extractions, the pinned libraries and
BMS1 (arXiv 1602.03148v3).

**Merging and severity.** Five pairs reported by two passes were merged. I set the R06.1 re-planning (/11) to medium,
because its nodes come from a later, unreviewed blueprint (#2917); one pass had rated it high.

**What I re-verified myself.** Every high finding, against the packets and decompositions:
- **/1.** The Proposition 4.13 node is tagged AI.2 and requires the Lemma 4.9 node, which RS-01 gives to AI.5. AI.5
  requires AI.2.
- **/2.** The CP.3 good-reduction node's statement uses Proposition 13.21 and Theorem 14.5(i), both CP.2 nodes. CP.2's
  discretely valued comparison requires that CP.3 node. The node's recorded prerequisites list only library carriers.
- **/3.** The accepted CohomologyComparisons decomposition names this AI.5 ⇄ CP.2 cycle; RS-01 keeps Proposition 13.21
  at CP.2.
- **/4.** AI.3's text covers only analytic generic fibres of smooth formal schemes. The P8:local-rational node imports
  Ô_X^+ from AI.3 for every locally noetherian adic space.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/restructure/RS-01.result.json owners[4]; layers['AInfCohomology:AI.5'].reason;
layers['CohomologyComparisons:CP.5'].keeps and .suppliedBy; RS-01.md section 'CP.5: generic specialization algebra
versus geometric recovery' (line 62); research/blueprint/restructure/RS-01.result.json owners[4] ('already tagged AI.5
supplier material') and layers['CohomologyComparisons:CP.5'].reason; RS-01.md 'CP.5: generic specialization algebra
versus geometric recovery' (line 62) and Summary (line 10)

**Claim.** RS-01 gives AI.5 the generic BMS1 section 4.2 module lemmas 'already tagged AI.5 supplier material'. That
includes CP.5/perfectness-and-tor-bounds-for-ainf-modules (Lemma 4.9). The AI.5 layer's 'finiteness/freeness' package
also reads as covering CP.5/ainf-module-structure-theorem (Proposition 4.13 with Lemmas 4.6-4.8, 4.10 and Corollary
4.12). AI.2 needs these. Its planned Lemma 4.26 (the etale specialization of every BKF module) reduces to the finite
free case 'using Proposition 4.13'. Remark 4.29 (full faithfulness of Fargues' functor) uses Lemma 4.26, and Proposition
4.13(i) 'is immediate from Lemma 4.9'. Since AI.5 requires AI.2, owning these lemmas at AI.5 creates a node-level cycle
AI.2 -> AI.5 -> AI.2 that the stage graph cannot see. The report also misquotes its input. The decomposition tags the
lemmas as 'AI.5/AI.2 supplier material' and tags Proposition 4.13 as owned by AI.2 ('torsion decompositions'). RS-01
says only AI.5. Coordinator note: FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 is this session's fix (PR #5263), and it wrote
the PAPER-BHATT-MORROW-SCHOLZE-18 route sentence quoted above. The finding does not rest on that sentence. In the
reviewed CohomologyComparisons packet, CP.5/ainf-module-structure-theorem (Proposition 4.13) is tagged as owned by AI.2
and requires CP.5/perfectness-and-tor-bounds-for-ainf-modules (Lemma 4.9), which is tagged AI.5. AI.5 requires AI.2. The
decomposition summary reads "AI.5/AI.2 supplier material". The coordinator checked all three. Also: RS-01 says the CP
decomposition marks its generic §4.2 lemmas as AI.5 supplier material. That is wrong for BMS1 Proposition 4.13, the
structure theorem for finitely presented A_inf-modules free after inverting p. Its node is tagged as AI.2 material and
corresponds to AI.2's 'torsion decompositions'. owners[4] covers only AI.5-tagged lemmas and excludes 'AI.2's separate
BKF/Fargues classification', so Proposition 4.13 remains a duplicate between AI.2's stage text and the CP.5 node.

**Evidence.** RS-01.result.json owners[4].target: 'The generic BMS §4.2 A_inf-module/complex specialization,
torsion-length, finite-presentation/freeness and adjacent-degree base-change lemmas already tagged AI.5 supplier
material ... This excludes AI.2's separate BKF/Fargues classification'. layers AI.5.reason: 'Own ... the generic BMS
§4.2 torsion/specialization/finiteness/freeness and adjacent-degree base-change package ... AI.2 continues to own its
separate finite-free BKF/Fargues classification'. RS-01.md:62: 'The partial integrated comparison decomposition
explicitly marks its generic §4.2 lemmas as AI.5 supplier material'. data/decompositions/CohomologyComparisons.json:4
(summary): 'The generic §4.2 lemmas are tagged as AI.5/AI.2 supplier material pending re-homing.'
research/blueprint/packets/CohomologyComparisons.json node CP.5/ainf-module-structure-theorem (line 683ff): '[Supplier
material: owned by AInfCohomology:AI.2 per its stage description ('torsion decompositions' ...)]'. Packet prerequisites
of that node: 'CohomologyComparisons:CP.5/perfectness-and-tor-bounds-for-ainf-modules', which is tagged 'owned by
AInfCohomology:AI.5'. AI.2 stage: 'Build kernels, tensor/dual operations in their valid subcategories, torsion
decompositions and the étale/Witt specializations ... Source: BMS1 Definition 4.22, Lemmas 4.26–27, Theorem 4.28 and its
proof.' AI.5 requires ['AInfCohomology:AI.2','AInfCohomology:AI.4']. BMS1 arXiv:1602.03148v3, proof of Lemma 4.26
(p.41): 'one can formally reduce to the case where M is finite free, using Proposition 4.13'. Remark 4.29: 'faithfulness
follows directly from Lemma 4.26'. Proof of Proposition 4.13 (p.37): '(i) is immediate from Lemma 4.9'. The accepted
research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json route to AI.2 (line 2253) already says: 'RS-01's
owner entry assigns the CohomologyComparisons perfectness-and-Tor node (Lemma 4.9) to AI.5; that conflicts with
Proposition 4.13 at AI.2 and cannot be carried out without a cycle'. RS-01.result.json is unchanged. Also:
data/decompositions/CohomologyComparisons.json summary: 'The generic §4.2 lemmas are tagged as AI.5/AI.2 supplier
material pending re-homing.' Node CP.5/ainf-module-structure-theorem: '[Supplier material: owned by AInfCohomology:AI.2
per its stage description ('torsion decompositions' of finitely presented A_inf-modules free after p-inversion) ...]'.
Gap 'Ownership ...': 'AInfCohomology:AI.2 owns BKF modules, torsion decompositions (Proposition 4.13) and Fargues'
equivalence'. AI.2 text (AInfCohomology/README.md): 'Build kernels, tensor/dual operations in their valid subcategories,
torsion decompositions'.

**Fix.** Replace owners[4] with two records. (a) {"target": "The structure theory of finitely presented A_inf-modules
free after inverting p (BMS1 §4.2): Kedlaya's Lemma 4.6 with Lemmas 4.7–4.8, Lemma 4.9 (perfectness, bounded torsion,
Tor-dimension ≤ 2, Tor-vanishing against W(k) for x-torsion-free M), Lemma 4.10, Corollary 4.12 and Proposition 4.13
(torsion decomposition and both freeness criteria), with their exact hypotheses. The reviewed nodes
CohomologyComparisons:CP.5/perfectness-and-tor-bounds-for-ainf-modules and CP.5/ainf-module-structure-theorem become
aliases. AI.2's Lemma 4.26 and Remark 4.29 use Proposition 4.13.", "owner": "AInfCohomology:AI.2", "formerly":
["CohomologyComparisons:CP.5"]}. (b) An AI.5 record limited to the complex-level specialization lemmas, Lemma 4.14 to
Corollary 4.20 (text in the finding on Lemma 4.18 below). Set layers CP.5.suppliedBy to ["AInfCohomology:AI.5",
"AInfCohomology:AI.2"]. Add links AI.2 -> CP.5 and AI.2 -> CP.6 (§15 forwarding; both acyclic, since AI.2 already
reaches both). In layers AI.5.reason replace 'the generic BMS §4.2 torsion/specialization/finiteness/freeness and
adjacent-degree base-change package' with 'the complex-level BMS §4.2 specialization lemmas (Lemma 4.14 to Corollary
4.20)'. Replace 'AI.2 continues to own its separate finite-free BKF/Fargues classification' with 'AI.2 owns the module
structure theory (Lemmas 4.6–4.10, Corollary 4.12, Proposition 4.13) that its Lemma 4.26 uses, and its BKF/Fargues
classification'. In CP.5.keeps replace 'Import the generic BMS §4.2 A_inf-module and complex specialization,
finiteness/freeness and adjacent-degree base-change lemmas from AI.5' with 'Import the module structure theory (Lemma
4.9, Proposition 4.13) from AI.2 and the complex-level specialization, freeness and adjacent-degree base-change lemmas
(Lemma 4.14 to Corollary 4.20) from AI.5'. In RS-01.md:62 replace 'explicitly marks its generic §4.2 lemmas as AI.5
supplier material' with 'tags its generic §4.2 lemmas as AI.5/AI.2 supplier material, with Proposition 4.13 at AI.2'.
Also: Add owners entry {"target": "Structure of finitely presented A_inf-modules free after inverting p (BMS1 Prop.
4.13: M_tor, M_free, M̄ exact sequence)", "owner": "AInfCohomology:AI.2", "formerly": ["CohomologyComparisons:CP.5"]},
set layers['CohomologyComparisons:CP.5'].suppliedBy to ['AInfCohomology:AI.5','AInfCohomology:AI.2'] (AI.2 -> AI.5 ->
CP.5 path exists), and in RS-01.md line 62 replace 'as AI.5 supplier material' with 'as AI.5/AI.2 supplier material'.

### /2 — error

**Where.** research/blueprint/restructure/RS-01.result.json links[18] (CohomologyComparisons:CP.3 ->
CohomologyComparisons:CP.2) and layers['CohomologyComparisons:CP.2'].reason; RS-01.md section 'CP.3 → CP.2: a previously
unrecorded filtered input' (lines 68-70)

**Claim.** The new edge CP.3 -> CP.2 closes a node-level cycle, because a CP.3 node depends on CP.2 nodes.
CP.3/good-reduction-bdr-lattice-identification states the degreewise good-reduction identification
H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ ≅ H^i_crys(X/B_dR^+). It derives this from Proposition 13.21, which is
CP.2/rational-crystalline-base-change-along-residue-section; RS-01 keeps that in CP.2. The node also asserts that the
B_crys comparison of Theorem 14.5(i) agrees with Theorem 13.1, and that comparison is
CP.2/rational-crystalline-comparison-over-C. Its acceptance list further requires compatibility with Fargues' pair for
H^i_Ainf(X), an AI.5 object; AI.5 is not upstream of CP.3. Meanwhile
CP.2/crystalline-comparison-over-discretely-valued-base requires this CP.3 node. With CP.3 -> CP.2 the order is CP.2
(Prop. 13.21, Thm 14.5(i)) -> CP.3 node -> CP.2 (Thm 14.6(i)). The report's statement 'CP.3 has no CP.2 prerequisite in
the inspected contracts' is false at node level. RS-01 itself calls the unfiltered comparison 'conceptually earlier' but
adds a whole-stage edge. Even the 'unfiltered' node CP.2/rational-crystalline-comparison-over-C states compatibility
with Theorem 13.1, so CP.3 is not used 'only for the later filtered comparison'. Coordinator note: Verified by the
coordinator, with a qualification. The recorded prerequisites of CP.3/good-reduction-bdr-lattice-identification are only
library carriers (mathlib:BDeRhamPlus, mathlib:Module.Free), so RS-01's sentence is true of the recorded prerequisites.
The dependency on CP.2 lies in the node's statement: it uses "the freeness of H^i_crys(X_{O/p}/A_crys)[1/p] from
Proposition 13.21 — a packet-authored step" and the agreement with Theorem 14.5(i).
CP.2/crystalline-comparison-over-discretely-valued-base lists this CP.3 node as a prerequisite.

**Evidence.** Packet research/blueprint/packets/CohomologyComparisons.json node
CP.3/good-reduction-bdr-lattice-identification (line 569ff), statement: 'the degreewise identification
H^i_crys(X_{O/p}/A_crys) ⊗_{A_crys} B_dR^+ ≅ H^i_crys(X/B_dR^+) is the one displayed in Theorem 14.5(i) (passing from
Proposition 13.23 to it uses the freeness of H^i_crys(X_{O/p}/A_crys)[1/p] from Proposition 13.21 — a packet-authored
step), and Theorem 14.5(i) asserts that under it the B_crys-comparison of Theorem 14.5(i) and the B_dR-comparison of
Theorem 13.1 agree.' Acceptance: 'The identification must be compatible with Fargues' pair for H^i_Ainf(X)'; 'Finite
freeness ... (Theorem 13.19; in the good-reduction case also Proposition 13.23 with Proposition 13.21)'.
CP.2/crystalline-comparison-over-discretely-valued-base prerequisites (packet lines 538-541):
CP.2/rational-crystalline-base-change-along-residue-section, CP.2/rational-crystalline-comparison-over-C,
CohomologyComparisons:CP.3, CP.3/good-reduction-bdr-lattice-identification. CP.2/rational-crystalline-comparison-over-C
statement: 'It is compatible with the isomorphism ... of Theorem 13.1 via the identification H^i_crys(X_{O/p}/A_crys) ⊗
B_dR^+ ≅ H^i_crys(X/B_dR^+).' RS-01.result.json layers CP.2.reason: 'Retain rational crystalline assembly,
section-dependent crystalline base change ... Add CP.3 only for the later filtered comparison'. RS-01.md:70: 'CP.3 has
no CP.2 prerequisite in the inspected contracts.' BMS1 v3 section 13.4 (p.116-117): after Remark 13.22, 'In particular,
we get a finite free B_dR^+-module H^i_crys(Y/A_crys) ⊗_{A_crys} B_dR^+.' Then Proposition 13.23: '... In particular,
H^i_crys(X/B_dR^+) is free over B_dR^+.' Theorem 14.5(i), p.120, includes the compatibility 'via the identification
H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ ≅ H^i_crys(X/B_dR^+)'. Graph: AI.5 does not reach CP.3 before or after RS-01.

**Fix.** Re-home the good-reduction identification of BMS1 section 13.4 from CP.3 to CP.2: Proposition 13.23 in
degreewise form, its use of Proposition 13.21, and the agreement of Theorem 14.5(i)'s B_crys comparison with Theorem
13.1. Concretely, add an owner record {"target": "The good-reduction B_dR^+-lattice identification
H^i_crys(X_{O/p}/A_crys) ⊗ B_dR^+ ≅ H^i_crys(X/B_dR^+) (BMS1 Proposition 13.23 with Proposition 13.21) and its
compatibility with Theorem 14.5(i) and with Fargues' pair of H^i_Ainf; node
CP.3/good-reduction-bdr-lattice-identification becomes an alias of a CP.2 node", "owner": "CohomologyComparisons:CP.2",
"formerly": ["CohomologyComparisons:CP.3"]}. CP.3 keeps Theorem 13.1, Theorem 13.19 and Remark 13.20 with the agreement
with Scholze's Theorem 5.1. Replace links[18].reason with: 'Input to CP.2: Theorem 13.1, finite freeness (Theorem 13.19)
and the agreement with Theorem 5.1 under Remark 13.20, used for the B_dR^+-compatibility in Theorem 14.5(i) and the
filtration in Theorem 14.6(i). The good-reduction identification of §13.4 is CP.2's own; CP.3 has no CP.2, AI.5 or
Proposition 13.21 input.' Replace RS-01.md:70's first sentence accordingly. CP.5/lattice-recovery-over-C then receives
the identification from CP.2, which is already upstream. (Alternative: split CP.2 into an unfiltered prefix stage,
holding Theorem 14.5(i) and Proposition 13.21 upstream of CP.3, and a filtered suffix fed by CP.3.)

### /3 — error

**Where.** research/blueprint/restructure/RS-01.result.json layers['CohomologyComparisons:CP.2'].reason
('section-dependent crystalline base change') together with layers['AInfCohomology:AI.5'].reason ('its BKF structure');
RS-01.md 'Reviewed decomposition conservation' (lines 237-243); research/blueprint/restructure/RS-01.result.json
layers['CohomologyComparisons:CP.2'].reason ('Retain ... section-dependent crystalline base change ...'); RS-01.md
'Reviewed decomposition conservation'

**Claim.** RS-01 keeps BMS1 Proposition 13.21 (the rational base change along a residue section, node
CP.2/rational-crystalline-base-change-along-residue-section) at CP.2. It also confirms that AI.5 owns the BKF structure
of H^i_Ainf. BMS1 proves the BKF property in Theorem 14.3 'using also Proposition 13.21', and CP.2 requires AI.5, so
this is an AI.5 <-> CP.2 ownership cycle at node level. The input decomposition RS-01 says it inspected names this cycle
and asks for Proposition 13.21 to be re-homed upstream; RS-01 did not do so. The accepted BMS paper extraction now
routes Proposition 13.21 to CrystallineCohomology:CR.3:Frobenius-isogeny, which contradicts RS-01's CP.2 text. This is
pre-existing (also reported as RT-AREA-padic-2/11 and RT-PAPER-BHATT-MORROW-SCHOLZE-18/2 against AI.5 and the paper
extraction), but RS-01 affirms the cyclic ownership. Coordinator note: This cycle predates RS-01 and was reported
against other targets as RT-AREA-padic-2/11 and RT-PAPER-BHATT-MORROW-SCHOLZE-18/2. RS-01 is at fault because it kept
the cyclic ownership although the accepted decomposition it cites asked for a re-homing.
FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 is this session's fix (PR #5263); it wrote the PAPER-BHATT-MORROW-SCHOLZE-18
routing of Proposition 13.21 to CR.3:Frobenius-isogeny, and FIX-RT-AREA-padic-2~2 is also this session's (PR #5266). The
fix job should therefore choose the owner independently: the decomposition offers CR.3 or AI.4. Also: BMS1 Proposition
13.21 is the rational crystalline base change along a residue-field section, node
CP.2/rational-crystalline-base-change-along-residue-section, and RS-01 keeps it in CP.2. AI.5's own target, the BKF
property of H^i_Ainf (BMS1 Theorem 14.3), uses Proposition 13.21, and AI.5 -> CP.2 is an existing edge. This is a
node-level cycle that the stage graph cannot show. Otherwise AI.5 must prove Proposition 13.21 a second time. The
accepted CP decomposition flagged exactly this and asked for Proposition 13.21 to be re-homed upstream; RS-01 cites that
decomposition but keeps the statement in CP.2.

**Evidence.** BMS1 v3 Theorem 14.3 proof (p.120): 'It follows that all cohomology groups are finite free after inverting
p by Corollary 4.20 and comparisons (iii) and (iv), using also Proposition 13.21. Thus, all cohomology groups are
Breuil–Kisin–Fargues modules.' data/decompositions/CohomologyComparisons.json gap 'Ownership of the generic A_inf linear
algebra and of Proposition 13.21' (line 1652ff): 'Proposition 13.21 (recorded under CP.2 per CP.2's description) is also
an input of AI.5's Theorem 14.3 (BKF property), while AI.5 → CP.2 is an existing edge: to avoid an AI.5 ⇄ CP.2 ownership
cycle, Proposition 13.21 should be re-homed upstream (CrystallineCohomology CR.3 as a Berthelot–Ogus-type base change,
or AI.4)'. RS-01.md:237: 'The header, relevant CP.0/CP.2 records and generic CP.5 supplier records were inspected'.
RS-01.md:241 preserves 'the distinction between section-dependent crystalline base change and the canonical discretely
valued specialization' in CP.2. research/blueprint/papers/PAPER-BHATT-MORROW-SCHOLZE-18.result.json route to AI.5 (line
2336): 'Theorem 14.3 (item 009) uses Proposition 13.21 (item 189), now routed to
CrystallineCohomology:CR.3:Frobenius-isogeny ... AI.5 imports it through the stage link CR.3:Frobenius-isogeny → AI.5,
which is to be added'. Graph: CR.3:Frobenius-isogeny has no consumers and reaches neither AI.5 nor CP.2; AI.5 does not
reach CR.3. Also: data/decompositions/CohomologyComparisons.json (accepted 2026-09-16) gap 'Ownership of the generic
A_inf linear algebra and of Proposition 13.21': 'Proposition 13.21 (recorded under CP.2 per CP.2's description) is also
an input of AI.5's Theorem 14.3 (BKF property), while AI.5 → CP.2 is an existing edge: to avoid an AI.5 ⇄ CP.2 ownership
cycle, Proposition 13.21 should be re-homed upstream (CrystallineCohomology CR.3 as a Berthelot–Ogus-type base change,
or AI.4) with CP.2 consuming it.' Gap 'Theorem 14.3/14.1 input package': 'the BKF property uses Corollary 4.20 with
comparisons (iii),(iv) and Proposition 13.21'. AI.5 text (AInfCohomology/README.md:169): 'that the latter satisfy the
BKF conditions'. CP.2 text (CohomologyComparisons/README.md:87): 'Prove the relevant crystalline
change-of-base/invariance statement after p-inversion'. Restructured graph: AI.5 -> CP.2 direct; AI.5 does not reach
CR.3 or AI.4, so CR.3 -> AI.5 or the AI.4 placement is acyclic.

**Fix.** Add owner record {"target": "BMS1 Proposition 13.21: H^i_crys(Y/A_crys)[1/p] ≅ H^i_crys(Ȳ/W(k)) ⊗_{W(k)}
A_crys[1/p] along a fixed section k → O/p, with the rational Frobenius isogeny for qcqs smooth O/p-schemes it uses; node
CP.2/rational-crystalline-base-change-along-residue-section becomes an alias", "owner":
"CrystallineCohomology:CR.3:Frobenius-isogeny", "formerly": ["CohomologyComparisons:CP.2"]}. Add links
CrystallineCohomology:CR.3:Frobenius-isogeny -> AInfCohomology:AI.5 and -> CohomologyComparisons:CP.5. Both are acyclic;
the latter is needed because CP.5/lattice-recovery-over-C uses the node. In layers CP.2.reason replace
'section-dependent crystalline base change' with 'the use of Proposition 13.21's section-dependent base change (owned by
CR.3:Frobenius-isogeny) and the canonical-section variant for a discretely valued base'. This keeps 'Preserve the
distinction between a fixed residue-field section and a genuinely canonical DVR specialization' in CP.2. Also: Add
owners entry {"target": "BMS1 Proposition 13.21: H^i_crys(X_{O_C/p}/A_crys)[1/p] ≅ H^i_crys(X_k/W(k)) ⊗ A_crys[1/p]
along a residue-field section, with its Frobenius-isogeny input for smooth affine k-schemes and the discretely valued
canonical-section variant", "owner": "CrystallineCohomology:CR.3", "formerly": ["CohomologyComparisons:CP.2"]} and a
link {source: 'CrystallineCohomology:CR.3', target: 'AInfCohomology:AI.5', reason: 'BKF property of H^i_Ainf uses Prop.
13.21'}. In layers['CohomologyComparisons:CP.2'].reason replace 'section-dependent crystalline base change' with 'the
use of CR.3's section-dependent base change (Prop. 13.21) in the comparison'. Alternatively make AI.4 the owner; in
either case CP.2 must not keep it.

### /4 — duplicate

**Where.** RS-01.md table row 'AI/AI.3 | PH/P8, PH/P8:local-rational, ...' and ledger rows AI/AI.3,
PH/P8:local-rational; no owners or layers record for AInfCohomology:AI.3 / PadicHodgeTheory:P8:local-rational

**Claim.** The integral pro-étale package (O_X^+, Ô_X^+, its tilt Ô^+_{X♭}, A_inf,X = W(Ô^+_{X♭}) with θ, and the almost
acyclicity of Ô_X^+ on affinoid perfectoids) was planned twice when RS-01 was written. AI.3's text plans it, but only on
generic fibres of smooth formal schemes. The accepted PadicHodgeTheory decomposition plans it inside P8:local-rational
for every locally noetherian adic space and asks for the nodes to be relocated to AI.3. RS-01 calls these 'inputs' but
records no owner, no relocation and no scope. As a result the current P8:local-rational packet imports these sheaves
from AI.3 in a generality AI.3 does not plan, so the general case now has no stage that plans it. AI.3 also plans 'the
comparison with rational period sheaves', which P8:local-rational, a later stage, constructs. Coordinator note: The
P8:local-rational nodes that import these sheaves from AI.3 come from the PadicHodgeTheory--P7 blueprint (PR #2917,
2026-09-25). The scope gap itself predates RS-01: the accepted PadicHodgeTheory decomposition of 2026-09-15 recorded it,
and RS-01 resolved the pair only as "inputs", without an owner or a scope.

**Evidence.** content/campaign/AInfCohomology/README.md:120-123: 'On the analytic generic fiber X of a smooth p-adic
formal scheme mathfrak X, construct the completed integral structure sheaf, its tilt and the Witt A_inf,X sheaf. Prove
the comparison with rational period sheaves'. data/decompositions/PadicHodgeTheory.json (accepted 2026-09-15): node
P8:local-rational/proetale-structure-sheaves-and-valuations ('For a locally noetherian adic space X over Spa(Q_p, Z_p),
define ... O_X^+ ... Ô_X^+ = lim O_X^+/p^n'), completed-structure-sheaf-on-affinoid-perfectoids ('(v) H^i(U, Ô_X^+) is
almost zero for i > 0'), period-sheaves-definitions ('A_inf = W(Ô^+_{X♭})'); gap 'AI.3 supplier nodes for Ô_X^+ and the
A_inf sheaf do not exist yet ... when AI.3 is written they should move there'. Current packet PadicHodgeTheory--P7.json
P8:local-rational/proetale-structure-sheaves-and-valuations: 'Let X be a locally noetherian adic space ... Ô_X^+ ... is
the completed integral structure sheaf imported from AInfCohomology AI.3'; packet restructure record 'AI.3's integral
pro-étale package must cover all locally noetherian adic spaces': 'AI.3's text claims ... but only on the analytic
generic fiber ... P8 and P8:local-rational apply these sheaves to arbitrary smooth rigid spaces'. RS-01.md row AI/AI.3:
'Integral sheaves and the independent AΩ toric computation are inputs; rational sheaves ... are not alternative names
for them.' Graph: AI.3 -> P8:local-rational direct; P8:local-rational does not reach AI.3 (so AI.3 must be the owner).

**Fix.** Add owners entry {"target": "Integral pro-étale sheaves O_X^+, Ô_X^+, Ô^+_{X♭}, A_inf,X = W(Ô^+_{X♭}) and theta
on X_proét for every locally noetherian adic space X over Spa(Q_p,Z_p), the affinoid perfectoid basis and the almost
acyclicity of Ô_X^+ and Ô^+_{X♭} (Scholze 2013 Def. 4.1/Lemma 4.2, Lemma 4.10, Def. 5.9/Lemma 5.10, Thm 6.5 for A_inf)",
"owner": "AInfCohomology:AI.3", "formerly": ["PadicHodgeTheory:P8:local-rational"]}. Add layers['AInfCohomology:AI.3']
{action: keep, reason: 'AI.3 owns the integral pro-étale package for all locally noetherian adic spaces, not only
generic fibres of smooth formal schemes; its comparison with the rational period sheaves B_inf, B_dR^+ is constructed in
P8:local-rational, which imports AI.3'}. Add layers['PadicHodgeTheory:P8:local-rational'] {action: narrow, keeps:
'rational sheaves O_X, Ô_X and valuations, rational acyclicity, B_inf/B_dR^+/B_dR and OB_dR^+ and crystalline/semistable
period sheaves, Poincaré lemmas', suppliedBy: ['AInfCohomology:AI.3']}.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | result owners[4]; … | RS-01 gives AI.5 the generic BMS1 section 4.2 module lemmas 'already tagged AI.5 supplier material'. That includes … |
| /2 | high | error | result links[18] (CohomologyComparisons:CP.3 -> …; … | The new edge CP.3 -> CP.2 closes a node-level cycle, because a CP.3 node depends on CP.2 nodes. CP.3/good-reduction-bdr-lattice-identification states the … |
| /3 | high | error | result layers['CohomologyComparisons:CP.2'].reason …; … | RS-01 keeps BMS1 Proposition 13.21 (the rational base change along a residue section, node CP.2/rational-crystalline-base-change-along-residue-section) at … |
| /4 | high | duplicate | RS-01.md table row 'AI/AI.3 / PH/P8, PH/P8:local-rational, ...' and …; … | The integral pro-étale package (O_X^+, Ô_X^+, its tilt Ô^+_{X♭}, A_inf,X = W(Ô^+_{X♭}) with θ, and the almost acyclicity of Ô_X^+ on affinoid perfectoids) was … |
| /5 | medium | missing | result layers['CohomologyComparisons:CP.0'].keeps and .suppliedBy; … | The reviewed CP.0 node CP.0/coherence-of-witt-vectors-of-perfectoid-integers (coherence of W_r(O), BMS1 Prop. 3.24, Lemmas 3.25-3.28, Cor. 3.29) is a CP.0 … |
| /6 | medium | missing | result layers['CohomologyComparisons:CP.0'].keeps; … | The reviewed CP.0 dictionary node also constructs BMS1 section 4.2 specialization objects that are not normalizations of any imported map. These are: item (a), … |
| /7 | medium | missing | result layers['CohomologyComparisons:CP.0'].keeps …; … | CP.0 keeps the Breuil-Kisin uniformizer in its dictionary as an 'identification among imported maps'. None of the four imported packages supplies it. … |
| /8 | medium | missing | result owners[4] and owners[0]; … | The supplier nodes RS-01 moves out of CP.5 have node-level prerequisites in CP.0. CP.0 is not upstream of AI.5 or AI.2, and RS-01 neither moves those CP.0 … |
| /9 | medium | error | result owners[4] ('already tagged AI.5 supplier material') versus … | BMS1 Lemma 4.18 with Remark 4.21 is a generic section 4.2 complex-specialization lemma: for perfect C with H^j(C)[1/p] free, H^i(C ⊗^L W(k)) is p-torsion-free … |
| /10 | medium | error | result layers['CohomologyComparisons:CP.5'].keeps ('... and the R06.4 …; … | A narrowed layer's keeps must state exactly what remains. RS-01 adds to CP.5 a target its stage never had, 'normalization comparisons with ... the R06.4 … |
| /11 | medium | duplicate | result owners[0] (AI.0:integral), owners[1] (CR.0), owners[3] …; … | R06.1's node-level plan re-plans targets that RS-01 gives to AI.0:integral and CR.0, and already proves the integral/rational compatibilities that owners[3] … |
| /12 | medium | duplicate | RS-01.md table row 'CP/CP.3 / PH/P8, PH/P8:local-rational, PH/R06.1' … | Three targets are planned in both CP.3 and P8: Scholze's de Rham comparison for constant coefficients, H_et ⊗ B_dR ≅ H_dR ⊗ B_dR with filtrations; the Hodge–de … |
| /13 | medium | missing | RS-01.md ledger rows AI/AI.5, CP/CP.3, PH/P8 (no owner named); … | No stage names Scholze's primitive comparison theorem (Sch13 Thm 5.1 / Cor. 5.11, and its A_inf form BMS1 Thm 5.7). Two branches with no path between them need … |
| /14 | medium | duplicate | RS-01.md table row 'AI/AI.6 / CP/CP.3, CP/CP.4, ...' ('Keep ... …; … | AI.6 plans to 'Construct the B_dR^+ comparison with the smooth generic fiber's canonical deformation'. That deformation is CP.3's construction, and CP.4 … |
| /15 | medium | duplicate | RS-01.md table row 'CP/CP.4 / CR/CR.6, ...' and ledger rows CP/CP.4 … | Both CR.6 and CP.4 plan the relation N phi = p phi N on Hyodo–Kato cohomology and the computation of the change-of-uniformizer transformation. CR.6 itself … |
| /16 | medium | duplicate | RS-01.md table rows 'CP/CP.4 / ... PR/PR.8', 'CR/CR.6 / PR/PR.8', …; … | Both PR.8 and CP.4 plan the comparison of the log-prismatic route with the AI.6/CR.6 semistable route on their overlap. Neither has the other's inputs: PR.8 … |
| /17 | medium | other | result owners[0] ('Witt reduction' to AI.0:integral) versus owners[1] …; … | CR.0 exports 'the maps induced by Witt reduction and theta' on A_cris, and inducing A_cris -> W(k) needs the Witt reduction A_inf -> W(k). RS-01 gives Witt … |
| /18 | medium | missing | result layers['CrystallineCohomology:CR.0'].reason ('import generic …; … | CR.0 plans the 'comparison with the derived PD construction in the lci range', which needs DD.0's derived divided powers and animated algebra. Its own packet … |
| /19 | medium | error | RS-01.md ledger row 'PR/PR.4 / Etale comparison, p-adic Tate twists … | The ledger says PR.4 owns 'logarithm/Chern constructions', but PR.4's text plans no prismatic logarithm or first Chern class; it mentions only 'arithmetic … |
| /20 | medium | duplicate | RS-01.md ledger row 'Q/Q0:integral-algebra / ... integral/Tate …; … | The comparison between integral perfectoid rings and perfectoid Tate rings (BMS1 Lemmas 3.20–3.21) is planned in Q0:integral-algebra, whose stage text and … |
| /21 | medium | other | research/blueprint/reviews/REV-RS-01.md:29 ('The real duplicates. …; … | The review accepted with no corrections on the strength of this claim, which is false. Other stages also re-plan what others own, either in their stage texts … |
| /22 | low | missing | result links (R06.1 -> CP.1/CP.2/CP.3) | CP.0 used to construct 'all ring maps to A_cris, B_cris, B_st and B_dR'. Within CP, the B_st part and the B_st -> B_dR map are consumed only by CP.4 ('after … |
| /23 | low | other | result layers['CohomologyComparisons:CP.0'].keeps (sentence 'Retain … | Coefficient-level twist and scalar-extension comparisons are now claimed by three layers. These are t versus mu, A_inf{1} versus Z_p(1) versus Fil^1, and the … |
| /24 | low | error | RS-01.md Summary (line 12: 'the only new reachability is CP.3 → …; … | The claim is false for the transitive closure. Adding the 19 links to research/blueprint/atlas/stage-edges.json creates four new reachable pairs: CP.3 -> CP.2, … |
| /25 | low | other | result layers['AInfCohomology:AI.5'] (action keep, reason 'Preserve … | RS-01's instruction to keep the supplier lemmas' exact hypotheses at AI.5 lives where nothing applies it. scripts/restructure.py ignores layers whose action is … |
| /26 | low | duplicate | result layers['AInfCohomology:AI.5'] (keep) versus … | The BMS1 section 2 counterexamples are planned as tests twice and RS-01 does not resolve it. These are the Enriques-type surface with free etale and torsion … |
| /27 | low | missing | result layers['CohomologyComparisons:CP.5'].keeps | The keeps text does not name CP.5's semistable branch explicitly: the Cesnavicius-Koshikawa sections 7-8 torsion inequalities with log-de Rham/crystalline … |
| /28 | low | duplicate | RS-01.md table rows 'CP/CP.1 / ... PR/PR.6' and 'AI/AI.7 / PR/PR.6, … | CP.1 and AI.7 both plan to prove that the earlier A_inf comparison maps agree with the prismatic ones through the BS22 §18 uniqueness argument. That argument … |
| /29 | low | duplicate | result layers['CohomologyComparisons:CP.2'].reason ('... … | The CP.2 keep record gives CP.2 the 'admissibility consequences'. CP.2's own text assigns admissibility to R06.2 and its applications to R06.5. The packets … |
| /30 | low | duplicate | RS-01.md ledger rows PH/R06.4 and PH/R06.2; … | Outside the family, R07's packet plans two PadicHodgeTheory targets that RS-01's ledger keeps in the family. R07.3/fl-admissibility plans Fontaine–Laffaille … |
| /31 | low | duplicate | RS-01.md 'Reviewed decomposition conservation' and table row 'Q/Q2 / … | RS-01 recorded an owner for the reviewed CP.5 nodes tagged for relocation to AI.5, but not for the reviewed Q2 nodes that the same kind of gap tags for … |
| /32 | low | library-claim | RS-01.md 'Input and evidence register', lines 34-35 | Two of the three pinned-source locators run past the end of their files. FontaineTheta.lean has 213 lines but is cited as 'lines 145–222'; BDeRham.lean has 98 … |

## Notes for the fix job

- **The cycles.** Put the §4.2 module lemmas (Lemma 4.9, Proposition 4.13) at AI.2 and keep only the complex-level
  specialization lemmas at AI.5. Move the CP.3 good-reduction identification into CP.2, or split CP.2. Re-home
  Proposition 13.21 upstream of AI.5; the decomposition offers CR.3 or AI.4.
- **Owners.** Give AI.3 the integral pro-étale package in full generality and narrow P8:local-rational. Assign the
  unowned CP.0 targets (the coherence node, the §4.2 dictionary items, the Breuil–Kisin uniformizer) and Lemma 4.18.
- **Duplications and ledger.** Settle the duplicated pairs or record why they differ, correct the false ledger claims,
  and fix the stale Mathlib line ranges.
