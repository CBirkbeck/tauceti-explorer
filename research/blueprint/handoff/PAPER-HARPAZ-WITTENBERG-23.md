# PAPER-HARPAZ-WITTENBERG-23 handoff

Codex, session codex-c83e7a; issue #1310. Partial extraction, ready for independent continuation rather than rereading from scratch.

Read the full 33-page December 2021 author final, matching arXiv v2 except its header. The publisher's 41-page pagination was not inspected. The report records URL, hash, pinned commits, ownership and exact corrections. There are 139 items (9 library, 15 planned, 115 missing); nine routes cover 113 missing plus seven planned items. Only two items are unrouted.

1. `PAPER-HARPAZ-WITTENBERG-23/46`: supply the explicit Remark 3.4 example over C((x))((y))((z)) with abelian stabilizer, a class satisfying the conjugacy-power tests, and nonzero Hochschild–Serre δ. The paper gives no witness. Keep δ in the general formula. This is not needed over number fields.
2. `PAPER-HARPAZ-WITTENBERG-23/139`: resolve or explicitly restrict the printed arbitrary-discrete-module Lemma 5.5. The report gives a concrete product-C2/direct-sum counterexample to continuity of the splitting torsor. Finite C repairs all actual paper applications. A general replacement must specify a suitable Hom topology or an open-stabilizer/continuous-torsor condition, not simply call Hom a discrete module.

The omitted length-six examples are now completed, and must NOT be put back on the gap list. For p=2,n=6, σ=e_01+e_12+e_56, the commuting-matrix equations force coordinate 25 to vanish on the fixed-conjugacy image, although e_25 is fixed. Over Q, take α=(χ,χ,0,0,0,χ) for χ of Q(√2), and cocycle β(σ)=e_25*. This gives a nonzero unramified class while the cyclic kernel is zero. Items `PAPER-HARPAZ-WITTENBERG-23/76` and `PAPER-HARPAZ-WITTENBERG-23/77` contain the full arguments. The length-four cyclic-kernel computation was also verified exactly (8 cocycles/4 coboundaries).

Preserve these repairs: fixed adjacent representatives in Proposition 7.3; finite-C hypothesis and ∂c=γ cup c with the flipped (-1)^m sign; explicit real-place lifting; Lemma 4.13 factor e_03^(a_2); §6 five-by-five subgroup; §7 eigenspace index i+m+1; internal-sum interpretation of P with one corner; geometric bar in Proposition 4.1; B_ω inside Br_1/Br_0, defined by local Brauer classes rather than only evaluation functions.

Upstream DGAInfinity Layer 8 owns generic Massey products; ProfiniteCohomology supplies continuous cochains; upper-unitriangular groups and filtration already exist in Tau Ceti. Do not duplicate these. The two proposed Part IIs have ordered interfaces finite algebra → geometry/Brauer → arithmetic. Existing source routes cover SF.1,SF.2,SF.4, RP.2, R02.2,R02.4 and IG.4. Grunwald–Wang is outside upstream ClassFieldTheory's stated scope.

No Lean deliverable or compilation is claimed. On continuation, refresh current atlas/audit/protocol inputs, settle the two gaps, then rerun the paper checker and intake checks on the exact three issue paths. A complete designation requires closing both gaps honestly, not deleting their source assertions without recording the disposition.
