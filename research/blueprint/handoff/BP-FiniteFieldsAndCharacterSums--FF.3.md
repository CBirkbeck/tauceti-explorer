# Handoff — BP-FiniteFieldsAndCharacterSums--FF.3

Agent: Codex — codex-jYursF. Issue: #6350. Branch: `codex-jYursF-ff3`.
Claim confirmed by the bot against [the claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/6350#issuecomment-6000343927). This is a complete target-level blueprint pass, not a checkpoint and not a formalization. The stage is **planned**, not closed.

## Delivered

- [Packet](../packets/FiniteFieldsAndCharacterSums--FF.3.json): eight new nodes (three constructions, five theorems), 14 API items, 11 unit tests, 12 personally checked baseline declarations, four supplier requests, one explicit comparison gap, one restructuring proposal and one evidence-backed WC.5 link.
- [Reader](../readmes/FiniteFieldsAndCharacterSums--FF.3.md): definitions, conventions, proof routes, every API and named test, source and ownership boundaries, and the inherited certified services. Approximately 3,000 words.
- [Suggested file](../suggested/FiniteFieldsAndCharacterSums--FF.3.lean): every new declaration/API/test and concrete acceptance examples, on actual Mathlib polynomials. It elaborates with only declaration-uses-`sorry` warnings. No implementation is claimed.

The new frontier is the monic squarefree carrier, unique monic squarefree-times-square decomposition with its degree equation, finite degree-indexed equivalence, convolution and exact count, nonmonic degree-pair presentation carrier and count, and all-monic prescribed-constant fibers including degree zero. The finite convolution gives the exact prerequisite route for BFP's recurrence without introducing another power-series framework. The carrier includes squarefree units at degree zero and includes both split and irreducible squarefree polynomials; the factor pair need not be coprime.

The parent packet's algorithms and counts are imported by their existing IDs, with their statements recorded in `imports`; none is re-planned. The `routedItems` field maps BFP's squarefree count to the new declarations and BKK `/73` and `/130` to the existing prime-polynomial, upper-bound and fixed-nonzero-constant nodes. Degree zero, degree one and zero constant coefficient are kept distinct. The six parent planets are retained by ID; this supplement adds zero planets to the already full FF.3 layer. No parent, atlas, queue, source-registry or foreign-roadmap file was changed.

## Source and baseline receipts

Personally read BFP arXiv:2206.07759v2, §5 opening/counting argument, printed pp. 7–8, and BKK arXiv:2007.14567v3, proof of Lemma 3.2, pp. 19–20, and Proposition 8.1/use, pp. 39–40. Version, URL, access date and PDF SHA-256 are in the packet. BFP's polynomial census works in characteristic two; its stated hyperelliptic presentation argument assumes odd q. This job does not extract the rest of either paper.

The positive-degree coefficient-fiber sentence in BKK is incorrect at auxiliary degree zero. This was already recorded in the parent as `FiniteFieldsAndCharacterSums/E734` and in its paper extraction as E6. The new boundary theorem supplies the correction; `sourceIssues` is empty because no fresh source error was discovered. The parent's Shoup, Schoof, Sutherland, complete-ring and modular Hensel routes are inherited, not claimed to have been re-read here. A fresh Shoup download was unavailable; no new declaration depends on guessing its text.

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed FF.3 audit was read. Pinned Mathlib's squarefree/UFD/polynomial source statements and the pinned Tau Ceti tree were searched. The baseline already supplies generic square-times-squarefree existence; no finite-field squarefree degree census or normalized polynomial-pair uniqueness/counting theorem was found. Tau Ceti's squarefree-part declarations for integers and rationals do not supply this target. The 12 cited Mathlib statements were read with their ambient hypotheses at the pin.

Open Mathlib PRs and the public Zulip archive were also screened for the squarefree polynomial census. The search found related squarefree, derivation, and root-counting work but no replacement census target. The prototype uses the existing polynomial vocabulary. The planned imported monic carrier is concretely reproduced as a clearly marked adapter from the parent suggested file; replace it with the parent's module import when implemented. It is not a new node or a claim of baseline availability.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.3.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums--FF.3.lean`: **exit 0**, only the required `sorry` warnings. Available memory was 96 GB before checking. Mathlib exactly matches the pin. The shared Tau Ceti checkout is newer, but the prototype imports only pinned Mathlib modules and uses no Tau Ceti declaration; pinned Tau source checks were made by commit.
- Cross-artifact verification: all eight proposed declarations, all 14 API names and all 11 named examples occur in the suggested file and reader; no node ID duplicates the parent; combined parent/supplement FF.3 planets remain six. WC.5 link quotes are literal substrings of the extracted stage descriptions.
- Independent finite arithmetic verification: enumerate monic polynomials over F₂, F₃, F₄=F₂[a]/(a²+a+1), and F₅ in degrees 0–6. Test squarefreeness with the Euclidean gcd of f and its derivative. Enumerate all source pairs (h,m) at every valid square-factor degree, multiply h·m², check no collision and equality with the full monic target set, then check all coefficient fibers and the convolution. All **26,212** monic polynomials and **26,212** pairs pass. Direct nonmonic enumeration checks P_g for g=0,1 over all four fields. The resulting P₀/P₁ counts are (4,12), (18,144), (48,720), (100,2400), respectively. These are arithmetic checks of the planned statements, not proofs of the admitted Lean examples.
- `git diff --check`: clean. Only the three issue deliverables and this handoff are included.

Scratch PDFs, extracts, generator drafts, and execution logs are disposable; all persistent source locators, hashes, mathematical corrections and validation results are above or in the packet. Do not resume an old scratch generator: the delivered packet includes final supplier/link corrections beyond its draft.

## Confirmed findings and disposition

| Finding | Disposition in this job | Integration still owned elsewhere |
| --- | --- | --- |
| RT-AREA-finitefields/1 | Reader separates FF.0/CA.3 algorithm inputs from character estimates. Restructuring proposal removes the mandatory all-FF.2 algorithm edge, changes FF.4/FF.5 packaging inputs and moves the elementary monic census to FF.0 without duplication. Existing node IDs are cited until assembly updates references. | Apply authorized stage/census moves and recompute depths; no foreign stage metadata was edited. |
| RT-AREA-finitefields/2 | Exact WC.5 request and inferred WC.5→FF.3 link: all r≥1, constant 2g for curves, Betti-number inequality for d>0 varieties, dimension-zero exception and actual point/cohomology comparison. Elliptic Hasse and affine character sums remain separate. | Supply the geometric comparison and general-model certificate representation described in the gap. |
| RT-AREA-finitefields/10 | Started from the accepted parent blueprint and its reviewed algorithm/source placement, not an unintegrated expansion draft. CN.0, CN.5 and WC.5 supplier questions are explicit in this packet. | Expansion queue/decomposition promotion and historical decision-record repairs belong to the authorized integration job. They are outside these deliverables. |
| RT-AREA-finitefields/11 | Parent FF.3 algorithm IDs are the single suppliers; restructuring proposal replaces the obsolete CN.1 full factorization node with consumer references and the checked-output/refinement contract. | CN.1's owner/integration job removes its stale duplicate and records the move in its own gap metadata. |
| RT-AREA-finitefields/12 | FA.7 is explicitly a consumer of FF.3 factorization and point-count certificates; it retains L-polynomial assembly and functional-equation checks. The general extension-count comparison requirement is exposed rather than inferred from an elliptic checker. | Apply FA.7 narrowing and its supplier edge in the authorized job. |
| RT-AREA-finitefields/17 | Reader assigns Shoup only its finite-field/factorization uses; inherits the parent's Schoof/Sutherland and Hensel source routes. New BFP/BKK declarations have independently checked public version-specific locators. | Source-registry/FF.4 integrations use the accepted parent's separate FF.4 source routes; this FF.3 job cannot edit the registry or FF.4 deliverables. |

## Remaining contracts and review focus

There is no second job to claim. The independent reviewer should check the eight new statements and the three constructions' APIs/tests, then validate the import and ownership boundaries.

Four requests remain explicit: CN.0's algebraic/bit cost and random-execution model; CN.0's executable coefficient-list refinements; CN.5's reusable finite-verification/certificate recording discipline; and WC.5's all-extension curve/variety bounds with point/cohomology comparison. The single gap is a concrete rational-point representation and cardinality comparison for general smooth projective models, including points at infinity. The parent root-table checker is for odd-characteristic Weierstrass models with a₁=a₃=0, and Schoof is elliptic. Neither is advertised as a general-variety certificate algorithm.

The parent grouped squarefree factorization, all certified algorithms, prime-polynomial identities and nonzero prescribed-constant asymptotic remain their existing planning contracts. Assembly must retain them while adding this supplement, apply the recorded structural fixes, and keep the stage's coverage planned until the stated general-model comparison is supplied. The blueprint pass is complete under PROTOCOL §0; mathematical closure and actual implementation are not asserted.
