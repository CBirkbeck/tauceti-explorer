# BP-LocallyAnalyticDistributions — Riesz finiteness checkpoint

Codex / codex-7e92bd; Refs #641. Own-job follow-up to merged PR3198
(head3fee04eb19372659f0e02be31f753f2683b626c8,
merge065cea18c60c6e3a95cd11bcc1ef577203784e37).
The same winning claim is5853317954, confirmed by bot5853318725; the full issue
was reread after confirmation. The review must remain unclaimed at publication.
Only the packet, reader, suggested Lean file and this handoff are changed.

## What this extends

All67 predecessor statements and hypotheses are preserved;66 whole node
objects and all13 adjugate nodes are unchanged. The composite Riesz theorem
has only its finite-projectivity proof step and three prerequisites refined.
Eight new nodes separate the finite geometric factor, native continuous
inverse on ker((1−au)^h), the promoted existing (Pr) retraction API,
inheritance of (Pr), compression of finite-image approximants, complete
continuity of identity, finite generation and algebraic projectivity.

For B=aΣ_{j<h}(1−au)^j, uB=Bu=1−(1−au)^h. No inverse of a is used.
For N=ker((1−au)^h), inclusion i and continuous projection π along F, put
l=πB. Then lui=identity_N. An arbitrary finite-A-image approximant α yields
β=lαi and error at most ‖l‖_K‖i‖_K‖u−α‖_K. It need not preserve N.
Tolerance ε/(1+‖l‖_K‖i‖_K) covers zero norm factors. The existing compact
identity criterion and finite-(Pr)-projective theorem finish the planned
chain. Canonical finite-module topology remains an explicit dependency gap.

The native kernel, continuous equivalence, projection and Module.Projective
are reused. AdicSpacesPartII:R3 remains the unique complete-continuity owner;
its generality request and the other four requests are unchanged. The full
root theorem still needs rank and determinant arguments over nonreduced A.
Neither a unit root parameter nor constant rank follows from this adapter:
over K×K, u=1,a=(1,0),h=1 gives the varying-rank summand (1,0)A.

## Validation

75 nodes:3 definitions,10 constructions,37 lemmas,18 theorems,7 comparisons.
49 API entries;60 packet tests;60 typed examples;6 planets;75 baseline
references. Definitions/constructions have45 API items and42 tests.
All implementation statuses remain unchecked;8 gaps,5 requests,0 closed stages.

The full suggested file elaborates with0errors and165 warnings, all proof
placeholders. All1,890 imported Mathlib sources byte-match the pin. There are
no actual Tau Ceti or planned-supplier imports; the labelled R3 signature
stub remains. A separate scratch file proves11 lemmas and constructs the
native kernel equivalence with0errors,0warnings,0placeholders against1,633
byte-checked Mathlib sources. It checks geometric inversion, kernel
invariance, compressed identity, finite-image mapping and the error bound.
It does not prove the whole chain against implemented suppliers.

Exact finite arithmetic passes611 assertions over primes2,3,5, including
18 approximants that leave the kernel and18 oblique-projection controls where
omitting the projection norm gives a false bound. It also checks Jordan
inverses and the nonunit product-ring parameter. Earlier adjugate and Riesz
checks are preserved as historical evidence and were not rerun here.

Current indexed blueprint, intake, errata, graph, API/test parity, predecessor
preservation and four-file scope checks pass with no errors, warnings or
problems. The dependency graph has75 reachable nodes,260 edges and72 baseline
leaves; its sole stage leaf is the explicitly requested AdicSpacesPartII:R3.
All46 captured inputs and all4 predecessor outputs match fresh main. The
issue is available, its body and winning bot are unchanged, and review316
is blocked and has no claim.

## Sources and inputs

Freshly read Buzzard full manuscript18–20 and23–25 and Serre printed80–82 /
PDF13–15. Both public PDFs match their existing hashes:
Buzzard0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d;
Serre67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402.
The explicit geometric factor and approximation compression are worker
deductions of Buzzard Proposition3.2. Serre's field-dimension proof is not
transferred. No new source finding or independent-review verdict is asserted.
BGR remains unacquired; earlier Coleman reading remains inherited provenance.

Reviewed AUDIT25, all five LAD stage contracts, RS16 and its accepted review,
predecessor interfaces and applicable ownership/link records were checked.
Captured non-errata inputs are unchanged from the primary continuation.
A targeted other-packet search confirms the R3 ownership; native declarations
were read at the exact pin before citation. This is not a new exhaustive audit.

## Resume

Discharge canonical finite-module topology and inverse norm bounds. Complete
the nonreduced finite-projective determinant/rank proof, Cayley–Hamilton,
polynomial division, the (Pr) exercises, completed tensors and Coleman
spectral-resultant transport. Then develop the actual distribution families,
universal-character action, uniform radii, semigroup bounds and specialization.
L0–L3 remain not_read; use existing PMIA suppliers and keep RS16 boundaries.

Suggested Lean SHA-256: f56d4005a203eeed9f5ab30a4cee420d520e4fb83f0cb4d4380d176e145e9cfa.
Scratch proof SHA-256: 44740c24c36f76590eb2df8b3b4e83432277027f14d10e6b3d9b62325d7d037e.
