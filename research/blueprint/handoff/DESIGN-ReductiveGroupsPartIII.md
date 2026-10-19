# DESIGN-ReductiveGroupsPartIII — Codex handoff

Issue #3357; session `codex-oyP8nS`; branch `codex-oyP8nS-reductive-groups-iii`. The bot confirmed the winning claim at [the claim thread](https://github.com/CBirkbeck/tauceti-explorer/issues/3357#issuecomment-6259799393). This is the complete target-level planning pass permitted by PROTOCOL §0, for independent review. It is not a dependency-closed packet and makes no implementation claim.

## Deliverables and coverage

The roadmap definition, packet, reader document and suggested Lean file are supplied at the issue's four paths. There are 42 nodes: 5 definitions, 4 constructions, 30 theorems, 1 comparison and 2 applications; 45 API items, 36 worked unit tests, 30 planets and 7 verified pinned baseline declarations. Every definition/construction has five API items, two uses and four tests. The reader gives every node's statement, hypotheses, proof outline, direct dependencies, source locator and acceptance check. The suggested file is 102 lines.

| Layer | Targets | Coverage | Principal remaining input |
| --- | ---: | --- | --- |
| RG3.0 | 8 | planned | Original Noot outer-action construction; RG/classical representation interfaces |
| RG3.1 | 6 | planned | Chebotarev and RGII Weil-restriction contracts |
| RG3.2 | 5 | planned | Harder/local-openness verification; exact torus localization maps |
| RG3.3 | 8 | planned | Current adelic neatness, finite class number and local boundedness interfaces |
| RG3.4 | 6 | planned | Two torus-embedding originals, geometry realization, arbitrary-CM unitary proof |
| RG3.5 | 9 | planned | Geometric common Frobenius/auxiliary realization; A4, D1 and relative ET.0 contracts |

No layer is marked closed. All implementation statuses remain `unchecked`. Each dependency chain ends at a pinned declaration, another blueprint node, a precise requested supplier stage or one of the seven explicit gaps. The graph of this packet is acyclic.

## Scope, routing and ownership

The issue expressly allows planning the first coherent direction and proposing the independent directions separately. RGIII owns the common Kisin–Zhou/KMPS arithmetic conjugacy and global-torus core. `routeCoverage` maps all 487 items in all 13 incoming routes individually. The 45 arithmetic items are all accounted for. Howe–Klevdal /019 is assigned to the shared scheme-theoretic line-stabilizer theorem at RG3.0, used by the rational algebraic-group highest-weight character basis. Gleason–Lim–Xu /D13 imports RGII's existing z-extension.

Ten restructuring proposals merge the arithmetic candidate, split eight independent directions and specify the geometric supplier/application boundary. The separate directions are coadjoint invariant theory; sigma-dual maps; stabilizers/Levi theory; local generation; integral representations; modular finite-reductive representations; arithmetic gerbs; and Grothendieck–Serre/purity. Integral routes coalesce, as do the three modular routes. No proposed roadmap other than RGIII was created here. Reserved `SchemeAndStackFoundations:key/galois-gerbs` remains its original owner.

Current upstream main was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. RGII already owns Weil restriction, local group topology and parahorics. Current Adelic Algebraic Groups §4.3 owns neatness. The Mumford–Tate definition, connectedness and reductivity remain the existing ShimuraData D1 nodes. Lie highest-weight and classical-group theories remain upstream; the new RG3.0 statement is the rational algebraic-group theorem for arbitrary connected reductive groups, with explicit agreement with ClassicalGroups Layer 3. No Lie classification, classical representation family or Schur functor is rebuilt.

The proposed geometry continuation consumes RG3.0–RG3.4 and supplies only the RG3.5 applications. Do not add whole-roadmap edges in both directions. Neither canonical models nor a characteristic polynomial alone supplies the needed geometric Frobenius theorem.

## Seven gaps to resume

1. **Geometric Frobenius/auxiliary realization:** supply Kisin–Zhou Theorem 5.1.4, Proposition 6.2.4 and Lemma 6.2.6(1), with a strongly acceptable triple, very special parahoric, preserved residue field, all-representation common classes and adelic local representatives. Candidate owner: `ShimuraVarietiesHondaTatePartII`; this is a proposal, not an existing supplier id.
2. **KMPS isogeny-group/Noot input:** supply I_s₀, the central neat Frobenius power, connected-centralizer isomorphisms, compactness modulo the ambient centre at infinity and common rational Conj′ values for every neat Weil point. KMPS §2.2.7 cites Noot Theorem 2.4, Lemmas 2.5–2.6 and §3 (especially p.68); obtain the original at DOI 10.1112/jlms/jdn049. Its author landing page was reached, not the paper.
3. **Global torus-embedding obstruction:** LR87 Lemma 5.6 was read in German; acquire its original input, Langlands *Les débuts d’une formule des traces stable*, Lemma 7.15. Check the quotient of global Tate cohomology by local images and the modern simply connected Hasse input.
4. **Quasi-split rational embedding:** obtain Kottwitz 1982 Corollary 2.2, Duke Math. J. 49, 785–806. The needed maximal-torus embedding theorem is distinct from ET.0's semisimple-element rationality theorem.
5. **Maximal-torus approximation:** obtain Harder 1966 Lemma 5.5.3, Math. Z. 92, 396–415. KMPS and Borovoi's restatement were read. The proof route via Lie-vector-space weak approximation needs RG2.0's precise local openness lemma, not weak approximation for G.
6. **Orthogonal outer action:** obtain Noot §1.5 and collate the actual SO-factor/descent convention. The construction here excludes Spin substitutions and type-D₄ triality.
7. **Arbitrary-CM odd-unitary Hasse theorem:** the full theorem remains the target. Shin's read proof assumes F=F⁺E with E imaginary quadratic. Extend the signed-permutation dual-centre local-global calculation to an arbitrary CM quadratic F/F⁺ of odd totally real degree. The special-case parity argument does not discharge this gap.

## Fifteen supplier requests

The packet specifies exact statements and consumers for RG Layers 1, 3, 4 and 7; ClassicalGroups Layer 3; Chebotarev Layer 10; GlobalNumberFields Layer 1; RGII RG2.0, RG2.0a and RG2.3; AdelicAlgebraicGroups AA.4; AbelianSchemes A4; ShimuraData D1; ET.0; and ET.0's fine Tate–Nakayama node. In particular, ET.0 needs the relative-inner-form Kottwitz obstruction, not just its equal-form theorem, and the quasi-split torus-embedding theorem. The fine torus request fixes the exact localization sequence and real-place convention.

## Sources and mathematical checks

Public originals read at the exact locators recorded in `sources`: Kisin–Zhou arXiv v2 §§5.1, 5.3 and 6; KMPS §§1.2, 2.1.8, 2.2 and the relevant §2.3 statements/proofs; Steinberg §§6.1–6.6; Kottwitz 1986 §§1–2 and 6 (scanned pages); Kottwitz 1990 §7 (printed pp.186–189); LR87 Lemma 5.6; Borovoi Lemma 5.6.3 and Theorem 5.12; Deligne Theorem 2.11 and §§3.4–3.8; Shin §3.1; Milne's corrected 2022 *Algebraic Groups*, Theorem 4.27/Lemma 4.28 and Theorem 22.2 with §§22.11–22.27. All public PDFs have recorded hashes. No private-library book or passage is included in the deliverables.

Six source findings are recorded, all awaiting independent review: the KZ H¹ bidegrees, arbitrary nonsemisimple compact lift, loss of the scalar/class in the real lift, one conjugation display, and KMPS's unrestricted scheme rigidity and unnecessary Levi assertion. These are scoped to the actual hashed preprint/author copies. Publisher full texts were not obtained; the findings are not assertions about the versions of record. Author/publisher pages and correction searches are listed per finding.

The real lifting proof now uses a semisimple point in an elliptic torus, normalization by the specified positive scalar and the character identity χ+cχ=mν. It restores the original class. The global cocharacter twist tracks both μ and its p-adic transport with one consistent cocycle. The realization theorem requires compactness modulo the ambient centre, stronger than a compact Cartan. Patching inputs are explicitly semisimple and adelic. Worked examples test finite versus injective quotient maps, noncommuting l-unit products, non-Serre real quadratic tori, unipotent versus neat points and both missing scheme hypotheses.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/ReductiveGroupsPartIII.json`: **0 errors, 0 warnings**, using the shared declaration index; baseline statements were also read in the pinned sources.
- `lean-check research/blueprint/suggested/ReductiveGroupsPartIII.lean`: **exit 0**, only ten declaration-uses-`sorry` warnings. It elaborated in the supplied shared build at the Mathlib pin. Memory available before compilation: 79 GB. No library build or language server was started.
- Source-issue schema/version checks, README/packet target/API/test concordance, route completeness, graph acyclicity, JSON validity, local-path/control-character checks and the no-sorry-data check were run before submission.

For independent review, start with the seven gaps and exact supplier contracts, then the two repaired lifting arguments and common-realization hypotheses. The complete pass is ready for review; no claim of source or dependency closure is made.
